import {
  HttpRequestHandler,
  postgraphile,
  PostGraphileOptions,
} from "postgraphile";
import PgSimplifyInflectorPlugin from "@graphile-contrib/pg-simplify-inflector";
// import extendSchemaPlugin from "./plugins";
import postgresql from "../postgresql";

const optionsDev: PostGraphileOptions = {
  enhanceGraphiql: true,
  exportGqlSchemaPath: "schema.graphql",
  extendedErrors: ["hint", "detail", "errcode"],
  graphiql: true,
  showErrorStack: "json",
  watchPg: true,
};

/**
 * @link https://www.graphile.org/postgraphile/usage-library/#for-production
 */
const options: PostGraphileOptions = {
  appendPlugins: [PgSimplifyInflectorPlugin /*, extendSchemaPlugin*/],
  disableQueryLog: true,
  dynamicJson: true,
  enableQueryBatching: true,
  extendedErrors: [],
  graphiql: true,
  ignoreRBAC: false,
  legacyRelations: "omit",
  retryOnInitFail: true,
  setofFunctionsContainNulls: false,
  showErrorStack: false,
  simpleCollections: "omit",
  subscriptions: true,
};

const graphql: HttpRequestHandler = postgraphile(
  postgresql.pool,
  "public",
  process.env.NODE_ENV == "production" ? options : { ...options, ...optionsDev }
);

export default graphql;
