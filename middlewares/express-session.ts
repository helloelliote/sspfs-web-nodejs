import connect_pg_simple from "connect-pg-simple";
import express from "express";
import expressSession from "express-session";
import pg from "./postgresql";

export default function (): express.RequestHandler {
  const postgresqlSession = connect_pg_simple(expressSession);
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
