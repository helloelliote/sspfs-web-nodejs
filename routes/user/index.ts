import { NextFunction, Request, Response } from "express";

export default {
  home(req: Request, res: Response, next: NextFunction) {
    res.render("index", {
      _csrfToken: res.locals._csrfToken,
      title: "소규모공공시설 웹조회시스템",
    });
  },

  isAuthenticated(options: any) {
    if (typeof options == "string") {
      options = { redirectTo: options };
    }
    options = options || {};

    const url = options.redirectTo || "/login";
    const setReturnTo =
      options.setReturnTo === undefined ? true : options.setReturnTo;

    return function (req: Request, res: Response, next: NextFunction) {
      if (!req.isAuthenticated || !req.isAuthenticated()) {
        if (setReturnTo && req.session) {
          // @ts-ignore
          req.session.returnTo = req.originalUrl || req.url;
        }
        return res.redirect(url);
      }
      next();
    };
  },

  login(req: Request, res: Response, next: NextFunction) {
    res.render("login");
  },

  logout(req: Request, res: Response, next: NextFunction) {
    req.logout(function (err) {
      if (err) {
        return next(err);
      }
      res.redirect("/login");
    });
  },

  signup(req: Request, res: Response, next: NextFunction) {
    res.render("signup");
  },
};
