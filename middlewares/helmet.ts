import helmet, { HelmetOptions } from "helmet";

const helmetOptions: HelmetOptions = {
  contentSecurityPolicy: {
    directives: {
      scriptSrc: ["'self'", "https://*.amcharts.com", "'unsafe-inline'"],
    },
  },
  crossOriginEmbedderPolicy: false,
};

export default helmet(helmetOptions);
