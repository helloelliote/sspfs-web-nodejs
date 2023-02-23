import helmet, { HelmetOptions } from "helmet";

const helmetOptions: HelmetOptions = {
  crossOriginEmbedderPolicy: false,
};

export default helmet(helmetOptions);
