import e, { NextFunction, Request, Response } from "express";
import createError from "http-errors";

// catch 404 and forward to error handler
const create: (
  req: e.Request,
  res: e.Response,
  next: e.NextFunction
) => void = (req: Request, res: Response, next: NextFunction) => {
  next(createError(404));
};

const handle: (err: any, req: e.Request, res: e.Response) => void = (
  err: any,
  req: Request,
  res: Response
) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
};

export default { create, handle };
