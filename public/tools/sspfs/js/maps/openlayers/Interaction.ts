import { defaults as interactions, MouseWheelZoom } from "ol/interaction";
import { DefaultsOptions } from "ol/interaction/defaults";

/**
 * 모든 옵션은 API 기본값(default)이 아닐 경우에 설정한다.
 */
const defaultsOptions: DefaultsOptions = {
  altShiftDragRotate: false,
  doubleClickZoom: false,
  onFocusOnly: true,
  pinchRotate: false,
  pinchZoom: false,
  shiftDragZoom: false,
  zoomDelta: 1,
  zoomDuration: 0,
};

const mouseWheelZoom: MouseWheelZoom = new MouseWheelZoom({
  constrainResolution: true,
  duration: 0,
});

export default interactions(defaultsOptions).extend([mouseWheelZoom]);
