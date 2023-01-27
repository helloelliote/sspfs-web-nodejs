import connect_pg_simple from "connect-pg-simple";
import expressSession from "express-session";
import postgresql from "./postgresql";

export default function () {
  const postgresqlSession = connect_pg_simple(expressSession);
  return expressSession({
    resave: false,
    saveUninitialized: false,
    // @ts-ignore
    secret: process.env.SESSION_KEY,
    store: new postgresqlSession({
      createTableIfMissing: true,
      pool: postgresql,
      schemaName: "private",
    }),
  });
}
