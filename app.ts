import dotenv from "dotenv";
import express, { Express } from "express";
import { engine } from "express-handlebars";
import { join } from "path";
import cookieParser from "cookie-parser";
import cors from "cors";
import favicon from "serve-favicon";
import { csrf, error, graphql, helmet, logger, session } from "./middlewares";
import indexRouter from "./routes";
import apiRouter from "./routes/api";

dotenv.config();

const app: Express = express();

app.engine(
  "hbs",
  engine({ extname: ".hbs", partialsDir: join(__dirname, "views") })
);
app.set("view engine", "hbs");
app.set("views", join(__dirname, "views"));

app.set("trust proxy", true);
app.use(helmet);
app.use(logger);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(join(__dirname, "public")));
app.use(session());
app.use(cookieParser());
app.use(graphql);
app.use(csrf.token);
app.use(csrf.protection);
app.use(cors());

app.use("/", indexRouter);
app.use("/api", apiRouter);

app.use(favicon(join(__dirname, "public", "favicon.ico")));

app.use(error.create);
app.use(error.handle);

export default app;
