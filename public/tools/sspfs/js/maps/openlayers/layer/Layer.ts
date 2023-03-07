import { Layer as BaseLayer } from "ol/layer";
import { layerProperties, LayerProperty } from "./Layer.property";

export default class Layer {
  readonly properties: Map<string, LayerProperty>;
  layerMap: Map<string, BaseLayer>;

  constructor() {
    this.properties = layerProperties;
    this.layerMap = new Map([]);
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
