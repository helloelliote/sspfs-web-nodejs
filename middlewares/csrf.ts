import { NextFunction, Request, Response } from "express";
import { doubleCsrf, DoubleCsrfUtilities } from "csrf-csrf";

const { doubleCsrfProtection, generateToken }: DoubleCsrfUtilities = doubleCsrf(
  {
    cookieName: "x-csrf-token",
    // @ts-ignore
    getSecret: (req: Request | undefined) => {
      return req ? req.session.id : process.env.CSRF_SECRET;
    },
  }
);

function generateCsrfToken(req: Request, res: Response, next: NextFunction) {
  res.locals._csrfToken = generateToken(res, req);
  next();
}

export default { protection: doubleCsrfProtection, token: generateCsrfToken };
