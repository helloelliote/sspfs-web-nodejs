import { NextFunction, Request, Response } from "express";
import { QueryResult, QueryResultRow } from "pg";
import pg from "../../middlewares/postgresql";

// language=PostgreSQL
export default {
  async features(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<QueryResultRow> {
    const { command, rowCount, rows }: QueryResult = await pg.query({
      name: "api/features",
      text: "SELECT 1;",
      values: [],
    });
    return rows;
  },
};
