import { Pool } from "pg";

class Postgresql {
  private static exists: boolean;
  private static instance: Postgresql;
  pool!: Pool;

  constructor() {
    if (Postgresql.exists) {
      return Postgresql.instance;
    }

    Postgresql.instance = this;
    Postgresql.exists = true;

    // @link https://node-postgres.com/features/connecting#environment-variables
    this.pool = new Pool();

    return this;
  }
}

export default new Postgresql().pool;
