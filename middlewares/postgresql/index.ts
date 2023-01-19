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

    this.pool = new Pool({
      database: process.env.PGDATABASE,
      host: process.env.PGHOST,
      password: process.env.PGPASSWORD,
      // @ts-ignore
      port: process.env.PGPORT,
      user: process.env.PGUSER,
    });

    return this;
  }
}

export default new Postgresql().pool;
