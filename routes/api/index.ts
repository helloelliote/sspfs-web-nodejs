import express from "express";
import select from "./select";

const router = express.Router();

router.get("/features", select.features);

export default router;
