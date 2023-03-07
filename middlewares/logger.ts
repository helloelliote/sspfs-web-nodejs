import { Request, Response } from "express";
import logger, { Options } from "morgan";

const morganOptions: Options<Request, Response> = {
  skip: function (req: Request, res: Response) {
    return /(assets|geoserver|graphql)/.test(req.path);
  },
};

export default logger("dev", morganOptions);
