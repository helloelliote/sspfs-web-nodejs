import dotenv from "dotenv";
import express, { Express, NextFunction, Request, Response } from "express";
import { join } from "path";
import helmet from "helmet";
import logger from "morgan";
import cookieParser from "cookie-parser";
import cors from "cors";
import favicon from "serve-favicon";
import createError from "http-errors";
import { csrf, graphql, session } from "./middlewares";
import indexRouter from "./routes";
import apiRouter from "./routes/api";

dotenv.config();

const app: Express = express();

// view engine setup
app.set("views", join(__dirname, "views"));
app.set("view engine", "hbs");

app.use(
  helmet({
    crossOriginEmbedderPolicy: false,
  })
);
/**
 @see Web Development with Node & Express 209쪽
 **/
app.enable("trust proxy");
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(join(__dirname, "public")));
app.use(session());
app.use(cookieParser());
app.use(graphql);
app.use(csrf.token);
app.use(csrf.protection);

app.use("/", indexRouter);
app.use("/api", cors(), apiRouter);

app.use(favicon(join(__dirname, "public", "favicon.ico")));

// catch 404 and forward to error handler
app.use((req: Request, res: Response, next: NextFunction) => {
  next(createError(404));
});

// error handler
app.use((err: any, req: Request, res: Response) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

export default app;
