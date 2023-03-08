import VectorLayer from "ol/layer/Vector";
import VectorSource from "ol/source/Vector";
import { GeoJSON } from "ol/format";
import { FeatureLike } from "ol/Feature";
import { Coordinate } from "ol/coordinate";
import { LineString, Point } from "ol/geom";
import Style, { createDefaultStyle } from "ol/style/Style";
import Layer from "./Layer";
import { styleProperties, StyleProperty } from "./property.style";
import { layerProperties, LayerProperty } from "./property.layer";

export default class Vector extends Layer {
  private readonly createLayer: (layer: string) => VectorLayer<VectorSource>;

  constructor() {
    super();
    const format: GeoJSON = new GeoJSON();
    const params: object = {
      outputFormat: "application/json",
      request: "GetFeature",
      service: "WFS",
      version: "2.0.0",
    };
    const pathname: string = "geoserver/sspfs47130/ows";
    const styleCache: Map<string | number, Style[]> = new Map();
    const styleFunction = (feature: FeatureLike): Style[] => {
      const id: number | string = feature.getId();
      if (styleCache.has(id)) {
        return styleCache.get(id);
      }
      const { fac_nam, fac_typ } = feature.getProperties();
      if (styleProperties.has(fac_typ)) {
        const styles: Style[] = [];
        const style: StyleProperty = styleProperties.get(fac_typ);
        switch (feature.getGeometry().getType()) {
          case "LineString": {
            const { image, stroke, text }: StyleProperty = style;
            //
            const line = new Style({ stroke, text });
            text.setText(fac_nam.replaceAll("_", " "));
            styles.push(line.clone());
            //
            const arrow: Style = new Style({ image });
            const [[x1, y1], [x2, y2]]: Coordinate[] = (
              feature.getGeometry() as LineString
            )
              .getCoordinates()
              .reverse();
            const rotation: number = -1 * Math.atan2(y1 - y2, x1 - x2);
            arrow.setGeometry(new Point([x1, y1]));
            arrow.getImage().setRotation(rotation);
            styles.push(arrow.clone());
            break;
          }
          case "Point": {
            const { image, text }: StyleProperty = style;
            //
            const point = new Style({ image, text });
            text.setText(fac_nam.replaceAll("_", " "));
            styles.push(point.clone());
            break;
          }
          default:
            break;
        }
        styleCache.set(id, styles);
        return styles;
      }
      return createDefaultStyle(feature, 0);
    };

    this.createLayer = (layer: string): VectorLayer<VectorSource> => {
      const { cql_filter, propertyName, typeName }: LayerProperty =
        layerProperties.get(layer);
      const url: string = this.constructUrl(pathname, {
        ...params,
        cql_filter,
        propertyName,
        typeName,
      });
      return new VectorLayer({
        source: new VectorSource({ format, url }),
        style: styleFunction,
      });
    };
  }

  addLayer(layers: string[]): void {
    super.addLayer(layers, this.createLayer);
  }
}
