import { Router } from "express";
import select from "./select";

const router: Router = Router();

router.get("/features", select.features);

export default router;
