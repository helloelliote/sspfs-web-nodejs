import { GeoJSON } from "ol/format";
import VectorLayer from "ol/layer/Vector";
import VectorSource from "ol/source/Vector";
import Layer from "./Layer";
import { LayerProperty } from "./Layer.property";
import { createDefaultStyle } from "ol/style/Style";

export default class Vector extends Layer {
  private readonly create: (layer: string) => VectorLayer<VectorSource>;

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

    this.create = (layer: string): VectorLayer<VectorSource> => {
      const { className, cql_filter, propertyName, typeName }: LayerProperty =
        this.properties.get(layer);
      const url: string = this.constructUrl(pathname, {
        ...params,
        cql_filter,
        propertyName,
        typeName,
      });
      return new VectorLayer({
        className,
        source: new VectorSource({ format, url }),
        style: createDefaultStyle,
      });
    };
  }

  addLayer = (layers: string[]): void => {
    super.addLayer(layers, this.create);
  };
}
