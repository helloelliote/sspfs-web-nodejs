import { Router } from "express";
import user from "./user";
import passport from "../middlewares/passport";

const router = Router();

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

export default router;
