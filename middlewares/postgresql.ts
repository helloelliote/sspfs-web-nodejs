import { Pool, QueryConfig } from "pg";

const pool = new Pool();

export default {
  pool: pool,

  async query(queryConfig: QueryConfig) {
    return await pool.query(queryConfig);
  },

  async transaction(queryConfigs: QueryConfig[]) {
    const client = await pool.connect();
    try {
      const result = [];
      await client.query("BEGIN");
      for (const queryConfig of queryConfigs) {
        result.push(await client.query(queryConfig));
      }
      await client.query("COMMIT");
      return result;
    } catch (e) {
      await client.query("ROLLBACK");
      throw e;
    } finally {
      client.release();
    }
  },
};
