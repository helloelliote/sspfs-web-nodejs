import helmet, { HelmetOptions } from "helmet";

const helmetOptions: HelmetOptions = {
  contentSecurityPolicy: {
    directives: {
      ...helmet.contentSecurityPolicy.getDefaultDirectives(),
      "script-src": [
        "'self'",
        "https://*.amcharts.com",
        "'sha256-ePXOiK09wqEBNG7NchdBZ7p/JTRMBfrAStg/+fvqHjE='",
        "'sha256-8EQ6UM+N1ubHgE9iLJ1+w6yMw4owRyonSYtudyKEbeQ='",
      ],
    },
  },
  crossOriginEmbedderPolicy: false,
};

export default helmet(helmetOptions);
