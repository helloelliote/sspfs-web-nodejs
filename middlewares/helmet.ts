import helmet, { HelmetOptions } from "helmet";

const helmetOptions: HelmetOptions = {
  contentSecurityPolicy: {
    directives: {
      scriptSrc: ["'self'", "'unsafe-inline'", "https://*.amcharts.com"],
    },
  },
  crossOriginEmbedderPolicy: false,
};

export default helmet(helmetOptions);
