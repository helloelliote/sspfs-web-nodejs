import View from "ol/View";
import { default as projection } from "./projection";
import BaseEvent from "ol/events/Event";

const view: View = new View({
  center: [203942.82730630485, 366219.4812165183],
  // center: transform([129.2251, 35.8563], "EPSG:4326", projection),
  extent: projection.getExtent(),
  projection,
  zoom: 12.3,
});

view.on("change:center", function (event: BaseEvent) {
  console.log(event.target.getZoom() + " / " + event.target.getCenter());
});

export default view;
