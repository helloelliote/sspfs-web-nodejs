import cookieParser from "cookie-parser";
import dotenv from "dotenv";
import express, { Express, NextFunction, Request, Response } from "express";
import createError from "http-errors";
import logger from "morgan";
import path from "path";
import helmet from "helmet";
import passport from "passport";
import cors from "cors";
import favicon from "serve-favicon";
import expressSession from "./middlewares/express-session";
import {
  doubleCsrfProtection as csrf,
  generateToken,
} from "./middlewares/csrf";
import indexRouter from "./routes";
import apiRouter from "./routes/api";
import graphql from "./middlewares/graphql";

dotenv.config();

const app: Express = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");

app.use(
  helmet({
    contentSecurityPolicy: false,
  })
);
/**
 @see Web Development with Node & Express 209쪽
 **/
app.enable("trust proxy");
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));
app.use(expressSession());
app.use(cookieParser());

app.use("/api", cors(), apiRouter);
app.use(graphql);

app.use(csrf);
app.use(passport.authenticate("session"));
app.use((req: Request, res: Response, next: NextFunction) => {
  res.locals._csrfToken = generateToken(res, req);
  next();
});

app.use("/", indexRouter);

app.use(favicon(path.join(__dirname, "public", "favicon.ico")));

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
