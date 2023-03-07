import helmet, { HelmetOptions } from "helmet";

const helmetOptions: HelmetOptions = {
  /*  contentSecurityPolicy: {
    directives: {
      ...helmet.contentSecurityPolicy.getDefaultDirectives(),
      "img-src": ["'self'", "https://!*.daumcdn.net"],
      "script-src": [
        "'self'",
        "https://!*.amcharts.com",
        "https://!*.kakao.com",
        "https://!*.daumcdn.net",
        "'sha256-ePXOiK09wqEBNG7NchdBZ7p/JTRMBfrAStg/+fvqHjE='",
        "'sha256-8EQ6UM+N1ubHgE9iLJ1+w6yMw4owRyonSYtudyKEbeQ='",
        "'sha256-Q2LTTlOEPNuobwC0NLNoGdtC5JfYYVXPXa8DqP26XNc='",
      ],
    },
  },*/
  contentSecurityPolicy: false,
  crossOriginEmbedderPolicy: false,
};

export default helmet(helmetOptions);
