import { NextFunction, Request, Response, Router } from "express";
import user from "./user";
import passport from "../middlewares/passport";

const router: Router = Router();

router.get("/", /*user.isAuthenticated,*/ user.home);
router.get("/login", user.login);
router.post(
  "/login",
  passport.authenticate("local", {
    successReturnToOrRedirect: "/",
    failureRedirect: "/login",
    failureMessage: true,
  })
);
router.post("/logout", user.logout);
router.get("/signup", user.signup);

router.get(/geoserver/, (req: Request, res: Response, next: NextFunction) => {
  res.redirect(302, `http://${req.hostname}:8080${req.originalUrl}`);
});

export default router;
