import { Request } from "express";
import { doubleCsrf, DoubleCsrfUtilities } from "csrf-csrf";

export const {
  doubleCsrfProtection, // This is the default CSRF protection middleware.
  generateToken, // Use this in your routes to provide a CSRF hash cookie and token.
}: DoubleCsrfUtilities = doubleCsrf({
  cookieName: "x-csrf-token",
  // @ts-ignore
  getSecret: (req: Request | undefined) => {
    return req ? req.session.id : process.env.CSRF_SECRET;
  },
});
