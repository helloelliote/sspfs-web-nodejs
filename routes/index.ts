import express from "express";

const router = express.Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { _csrfToken: req.csrfToken() });
});

export default router;
