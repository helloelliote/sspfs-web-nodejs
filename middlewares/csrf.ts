import { NextFunction, Request, Response } from "express";
import {
  doubleCsrf,
  DoubleCsrfConfigOptions,
  DoubleCsrfUtilities,
} from "csrf-csrf";

const doubleCsrfConfigOptions: DoubleCsrfConfigOptions = {
  cookieName: "x-csrf-token",
  getSecret: (req?: Request): string => {
    return req ? req.session.id : (process.env.CSRF_SECRET as string);
  },
};

const { doubleCsrfProtection, generateToken }: DoubleCsrfUtilities = doubleCsrf(
  doubleCsrfConfigOptions
);

const generateCsrfToken = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  res.locals._csrfToken = generateToken(res, req);
  next();
};

export default { protection: doubleCsrfProtection, token: generateCsrfToken };
