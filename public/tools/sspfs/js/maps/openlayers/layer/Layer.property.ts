import { Stroke, Style, Text } from "ol/style";

interface LayerProperty {
  cql_filter: string;
  propertyName: string[];
  typeName: string;
}

const layerProperties: Map<string, LayerProperty> = new Map([
  [
    "ol-layer-vector-b",
    {
      cql_filter: "fac_typ='B'",
      propertyName: ["fac_nam", "fac_typ", "fac_uid", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
  [
    "ol-layer-vector-e",
    {
      cql_filter: "fac_typ='E'",
      propertyName: ["fac_nam", "fac_typ", "fac_uid", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
  [
    "ol-layer-vector-f",
    {
      cql_filter: "fac_typ='F'",
      propertyName: ["fac_nam", "fac_typ", "fac_uid", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
]);

const text: Text = new Text({
  font: "bold 0.9rem Noto Sans KR",
  placement: "line",
  stroke: new Stroke({
    color: "#ffffff",
    width: 3,
  }),
});

const layerStyles: Map<string, Style> = new Map([
  [
    "B",
    new Style({
      stroke: new Stroke({
        color: "#0045ff",
        width: 1.5,
      }),
      text,
    }),
  ],
]);

export { LayerProperty, layerProperties, layerStyles };
