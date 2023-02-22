import { gql, makeExtendSchemaPlugin } from "graphile-utils";
import { Build, Plugin } from "postgraphile";

const extendSchemaPlugin: Plugin = makeExtendSchemaPlugin((build: Build) => {
  const { pgSql: sql, inflection } = build;

  return {
    typeDefs: gql``,
    resolvers: {},
  };
});

export default extendSchemaPlugin;
