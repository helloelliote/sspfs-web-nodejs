interface LayerProperty {
  className: string;
  cql_filter: string;
  propertyName: string[];
  typeName: string;
}

interface StyleProperty {}

const layerProperties: Map<string, LayerProperty> = new Map([
  [
    "ol-layer-vector-b",
    {
      className: "ol-layer ol-layer-vector ol-layer-vector-b",
      cql_filter: "fac_typ='B'",
      propertyName: ["fac_uid", "fac_nam", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
  [
    "ol-layer-vector-e",
    {
      className: "ol-layer ol-layer-vector ol-layer-vector-e",
      cql_filter: "fac_typ='E'",
      propertyName: ["fac_uid", "fac_nam", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
  [
    "ol-layer-vector-f",
    {
      className: "ol-layer ol-layer-vector ol-layer-vector-f",
      cql_filter: "fac_typ='F'",
      propertyName: ["fac_uid", "fac_nam", "geom"],
      typeName: "sspfs47130:view_risk_evaluation_line",
    },
  ],
]);

export { LayerProperty, layerProperties };
