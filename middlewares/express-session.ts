import { RequestHandler } from "express";
import connect_pg_simple from "connect-pg-simple";
import expressSession from "express-session";
import pg from "./postgresql";

const postgresqlSession = connect_pg_simple(expressSession);
export default (): RequestHandler =>
  expressSession({
    cookie: {
      secure: process.env.NODE_ENV == "production",
    },
    proxy: true,
    resave: false,
    saveUninitialized: true,
    // @ts-ignore
    secret: process.env.SESSION_KEY,
    store: new postgresqlSession({
      createTableIfMissing: true,
      pool: pg.pool,
      schemaName: "private",
    }),
  });
