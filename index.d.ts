declare module "*.svg" {
  const content: unknown;
  export default content;
}

declare module "*.png" {
  const src: string;
  export default src;
}

declare const kakao: any;
