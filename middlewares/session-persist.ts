// @ts-nocheck
import { NextFunction, Request, Response } from "express";

export default function (req: Request, res: Response, next: NextFunction) {
  const err = req.session.error;
  const msg = req.session.success;
  delete req.session.error;
  delete req.session.success;
  res.locals.message = "";
  if (err) res.locals.message = `<p class="msg error">${err}</p>`;
  if (msg) res.locals.message = `<p class="msg success">${msg}</p>`;
  next();
}
