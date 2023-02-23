import { Pool, PoolClient, QueryConfig } from "pg";

const pool: Pool = new Pool();

/**
 * @link https://node-postgres.com/features/queries#prepared-statements
 */
export default {
  pool,

  async query(queryConfig: QueryConfig) {
    return await pool.query(queryConfig);
  },

  async transaction(queryConfigs: QueryConfig[]) {
    const client: PoolClient = await pool.connect();
    try {
      const result: unknown[] = [];
      await client.query("BEGIN");
      for (const queryConfig of queryConfigs) {
        result.push(await client.query(queryConfig));
      }
      await client.query("COMMIT");
      return result;
    } catch (e: unknown) {
      await client.query("ROLLBACK");
      throw e;
    } finally {
      client.release();
    }
  },
};
