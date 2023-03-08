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

export { layerProperties, LayerProperty };
