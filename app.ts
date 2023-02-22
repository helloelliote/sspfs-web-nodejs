import dotenv from "dotenv";
import express, { Express } from "express";
import { join } from "path";
import logger from "morgan";
import cookieParser from "cookie-parser";
import cors from "cors";
import favicon from "serve-favicon";
import { csrf, error, graphql, helmet, session } from "./middlewares";
import indexRouter from "./routes";
import apiRouter from "./routes/api";

dotenv.config();

const app: Express = express();

// view engine setup
app.set("views", join(__dirname, "views"));
app.set("view engine", "hbs");

app.use(helmet);
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

app.use(error.create);
app.use(error.handle);

export default app;
