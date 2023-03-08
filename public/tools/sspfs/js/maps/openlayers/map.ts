import Map from "ol/Map";
import interactions from "./Interaction";
import Vector from "./layer/Vector";
import view from "./view";

const vectorLayer = new Vector();
vectorLayer.addLayer([
  "ol-layer-vector-b",
  "ol-layer-vector-e",
  "ol-layer-vector-f",
]);

const olMap: Map = new Map({
  interactions,
  target: "olMap",
  layers: [...vectorLayer.layers],
  view,
});

export default olMap;
