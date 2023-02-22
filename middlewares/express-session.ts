import { RequestHandler } from "express";
import connect_pg_simple from "connect-pg-simple";
import expressSession from "express-session";
import pg from "./postgresql";

const postgresqlSession = connect_pg_simple(expressSession);
export default function (): RequestHandler {
  return expressSession({
    resave: false,
    saveUninitialized: false,
    // @ts-ignore
    secret: process.env.SESSION_KEY,
    store: new postgresqlSession({
      createTableIfMissing: true,
      pool: pg.pool,
      schemaName: "private",
    }),
  });
}
