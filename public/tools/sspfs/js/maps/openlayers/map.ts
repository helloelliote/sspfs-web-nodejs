import Map from "ol/Map";
import view from "./view";
import Vector from "./layer/Vector";

const vectorLayer = new Vector();
vectorLayer.addLayer(["ol-layer-vector-b"]);

const olMap: Map = new Map({
  target: "olMap",
  layers: [...vectorLayer.layers],
  view,
});

export default olMap;
