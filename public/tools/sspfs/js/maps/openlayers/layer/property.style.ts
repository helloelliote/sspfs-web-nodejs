import { Fill, Icon, Stroke, Text } from "ol/style";

interface StyleProperty {
  image?: Icon;
  stroke?: Stroke;
  text?: Text;
}

const styleProperties: Map<string, StyleProperty> = new Map([
  [
    "B",
    {
      image: new Icon({
        color: "#0045ff",
        src: "assets/media/symbols/arrow.svg",
        size: [15, 15],
        imgSize: [15, 15],
        anchor: [0.5, 0.5],
        rotation: null,
      }),
      stroke: new Stroke({
        color: "#0045ff",
        width: 1.5,
      }),
      text: new Text({
        fill: new Fill({ color: "#0045ff" }),
        font: "bold 0.9rem Noto Sans KR",
        placement: "line",
        stroke: new Stroke({ width: 2, color: "#ffffff" }),
      }),
    },
  ],
  [
    "E",
    {
      image: new Icon({
        color: "#00ff00",
        src: "assets/media/symbols/arrow.svg",
        size: [15, 15],
        imgSize: [15, 15],
        anchor: [0.5, 0.5],
        rotation: null,
      }),
      stroke: new Stroke({
        color: "#00ff00",
        width: 1.5,
      }),
      text: new Text({
        fill: new Fill({ color: "#00ff00" }),
        font: "bold 0.9rem Noto Sans KR",
        placement: "line",
        stroke: new Stroke({ width: 2, color: "#ffffff" }),
      }),
    },
  ],
  [
    "F",
    {
      image: new Icon({
        color: "#00ffff",
        src: "assets/media/symbols/arrow.svg",
        size: [15, 15],
        imgSize: [15, 15],
        anchor: [0.5, 0.5],
        rotation: null,
      }),
      stroke: new Stroke({
        color: "#00ffff",
        width: 1.5,
      }),
      text: new Text({
        fill: new Fill({ color: "#00ffff" }),
        font: "bold 0.9rem Noto Sans KR",
        placement: "line",
        stroke: new Stroke({ width: 2, color: "#ffffff" }),
      }),
    },
  ],
]);

export { styleProperties, StyleProperty };