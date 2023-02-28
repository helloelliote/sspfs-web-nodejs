import { Request, Response } from "express";
import logger, { Options } from "morgan";

const morganOptions: Options<Request, Response> = {
  skip: function (req: Request, res: Response) {
    return req.path.includes("assets");
  },
};

export default logger("dev", morganOptions);
