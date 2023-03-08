import { Layer as BaseLayer } from "ol/layer";
import { FeatureLike } from "ol/Feature";
import { Style } from "ol/style";
import { createDefaultStyle } from "ol/style/Style";
import { layerProperties, LayerProperty, layerStyles } from "./Layer.property";

export default class Layer {
  readonly properties: Map<string, LayerProperty>;
  readonly styles: Map<string, Style>;
  styleCache: Map<string | number, Style>;
  styleFunction: (feature: FeatureLike) => Style[];
  layerMap: Map<string, BaseLayer>;

  constructor() {
    this.layerMap = new Map<string, BaseLayer>();
    this.properties = layerProperties;
    this.styles = layerStyles;
    this.styleCache = new Map<string | number, Style>();
    this.styleFunction = (feature: FeatureLike): Style[] => {
      const id = feature.getId();
      if (this.styleCache.has(id)) {
        return [this.styleCache.get(id)];
      }
      const { fac_nam, fac_typ } = feature.getProperties();
      if (this.styles.has(fac_typ)) {
        const style = this.styles.get(fac_typ);
        switch (feature.getGeometry().getType()) {
          case "LineString":
          case "MultiLineString": {
            style.getText().setText(fac_nam.replaceAll("_", " "));
            break;
          }
          default: {
            break;
          }
        }
        this.styleCache.set(id, style.clone());
        return [style];
      }
      return createDefaultStyle(feature, 0);
    };
  }

  get layers(): IterableIterator<BaseLayer> {
    return this.layerMap.values();
  }

  getLayer(layer: string): BaseLayer {
    return this.layerMap.get(layer);
  }

  addLayer(layers: string[], create: (layer: string) => BaseLayer) {
    for (const layer of layers) {
      if (this.layerMap.has(layer)) {
        this.layerMap.get(layer).getSource().refresh();
      } else {
        const newLayer: BaseLayer = create(layer);
        this.layerMap.set(layer, newLayer);
      }
    }
  }

  removeLayer(layers: string[]): void {
    for (const layer of layers) {
      this.layerMap.get(layer)?.setVisible(false);
    }
  }

  constructUrl(pathname: string = "", params: object = {}): string {
    const url: URL = new URL(pathname, window.location.origin);
    for (const [key, value] of Object.entries(params)) {
      url.searchParams.set(key, value);
    }
    return url.toString();
  }
}
