import passport from "passport";
import LocalStrategy from "passport-local";
import bcrypt from "bcrypt";
import { QueryResult } from "pg";
import postgresql from "./postgresql";

/* Configure password authentication strategy.
 *
 * The `LocalStrategy` authenticates users by verifying a username and password.
 * The strategy parses the username and password from the request and calls the
 * `verify` function.
 *
 * The `verify` function queries the database for the user record and verifies
 * the password by hashing the password supplied by the user and comparing it to
 * the hashed password stored in the database.  If the comparison succeeds, the
 * user is authenticated; otherwise, not.
 */
// language=PostgreSQL
passport.use(
  // @ts-ignore
  new LocalStrategy(function verify(
    username: string,
    password: string,
    callback: Function
  ) {
    postgresql
      .query({
        text: `SELECT *
                   FROM private.sys_users
                   WHERE username = $1`,
        values: [username],
      })
      .then((queryResult: QueryResult) => {
        if (queryResult.rowCount == 0) {
          return callback(null, false, {
            message: "",
          });
        }

        const row = queryResult.rows[0];

        bcrypt.compare(
          password,
          row["hashed"],
          (err: Error | undefined, result: boolean) => {
            if (err) return callback(err);
            if (!result) {
              return callback(null, false, {
                message: "",
              });
            }
            return callback(null, row);
          }
        );
      })
      .catch((err: Error) => callback(err));
  })
);

/* Configure session management.
 *
 * When a login session is established, information about the user will be
 * stored in the session.  This information is supplied by the `serializeUser`
 * function, which is yielding the user ID and username.
 *
 * As the user interacts with the app, subsequent requests will be authenticated
 * by verifying the session.  The same user information that was serialized at
 * session establishment will be restored when the session is authenticated by
 * the `deserializeUser` function.
 *
 * Since every request to the app needs the user ID and username, in order to
 * fetch records and render the user element in the navigation bar, that
 * information is stored in the session.
 */
passport.serializeUser(function (user: any, callback: Function): void {
  process.nextTick(function () {
    callback(null, { id: user.id, username: user.username });
  });
});

passport.deserializeUser(function (
  user: Express.User,
  callback: Function
): void {
  process.nextTick(function () {
    return callback(null, user);
  });
});

export default passport;
