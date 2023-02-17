// noinspection ES6UnusedImports
import { SessionData } from "express-session";

declare module "*.svg" {
  const content: any;
  export default content;
}

declare module "*.png" {
  const src: string;
  export default src;
}
