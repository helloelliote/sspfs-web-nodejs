import proj4 from "proj4";
import { get as getProjection, Projection } from "ol/proj";
import { register } from "ol/proj/proj4";

/**
 * @link https://epsg.io/5187.js
 */
proj4.defs(
  "EPSG:5187",
  "+proj=tmerc +lat_0=38 +lon_0=129 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs +type=crs"
);
register(proj4);

// Create an OpenLayers projection object
const epsg5187: Projection = getProjection("EPSG:5187");
epsg5187.setExtent([-415909.65, -426336.34, 649203.95, 865410.62]);

export default epsg5187;
