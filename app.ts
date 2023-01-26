import cookieParser from "cookie-parser";
import dotenv from "dotenv";
import express, { NextFunction, Request, Response } from "express";
import createError from "http-errors";
import logger from "morgan";
import path from "path";
import connect_pg_simple from "connect-pg-simple";
import expressSession from "express-session";
import helmet from "helmet";
import cors from "cors";
import postgresql from "./middlewares/postgresql";
import csrf from "./middlewares/csrf";
import indexRouter from "./routes";
import apiRouter from "./routes/api";

dotenv.config();

const app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");

const postgresqlSession = connect_pg_simple(expressSession);
const session = expressSession({
  resave: false,
  // @ts-ignore
  secret: process.env.SESSION_KEY,
  store: new postgresqlSession({
    createTableIfMissing: true,
    pool: postgresql,
    schemaName: "private",
  }),
});

app.use(helmet());
/**
 @see Web Development with Node & Express 209쪽
 **/
app.enable("trust proxy");
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(session);
app.use(express.static(path.join(__dirname, "public")));

app.use(csrf, (req: Request, res: Response, next: NextFunction) => next());
app.use("/", indexRouter);
app.use("/api", cors(), apiRouter);

// catch 404 and forward to error handler
app.use(function (req: Request, res: Response, next: NextFunction) {
  next(createError(404));
});

// error handler
app.use(function (err: any, req: Request, res: Response, next: NextFunction) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

export default app;
