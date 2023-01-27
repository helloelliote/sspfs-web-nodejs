import express from "express";

const router = express.Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", {
    _csrfToken: req.csrfToken(),
    title: "소규모공공시설 웹조회시스템",
  });
});

export default router;
