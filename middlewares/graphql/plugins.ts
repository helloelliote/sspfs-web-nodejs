import {
  ExtensionDefinition,
  gql,
  makeExtendSchemaPlugin,
} from "graphile-utils";
import { Build, Options, Plugin } from "postgraphile";

const extendSchemaPlugin: Plugin = makeExtendSchemaPlugin(
  (build: Build, schemaOptions: Options): ExtensionDefinition => {
    const { pgSql: sql, inflection } = build;
    const {} = schemaOptions;

    // example data
    const authors = [
      { id: 1, firstName: "Tom", lastName: "Coleman" },
      { id: 2, firstName: "Sashko", lastName: "Stubailo" },
      { id: 3, firstName: "Mikhail", lastName: "Novikov" },
    ];

    const posts = [
      { id: 1, authorId: 1, title: "Introduction to GraphQL", votes: 2 },
      { id: 2, authorId: 2, title: "Welcome to Meteor", votes: 3 },
      { id: 3, authorId: 2, title: "Advanced GraphQL", votes: 1 },
      { id: 4, authorId: 3, title: "Launchpad is Cool", votes: 7 },
    ];

    return {
      typeDefs: /* GraphQL */ gql`
        type Author {
          id: Int!
          firstName: String
          lastName: String
          """
          the list of Posts by this author
          """
          posts: [Post]
        }

        type Post {
          id: Int!
          title: String
          author: Author
          votes: Int
        }

        # the schema allows the following query:
        extend type Query {
          posts: [Post]
          author(id: Int!): Author
        }

        # this schema allows the following mutation:
        extend type Mutation {
          upvotePost(postId: Int!): Post
        }
      `,

      resolvers: {
        Query: {
          posts: () => posts,
          author: (_, { id }) => authors.find((author) => author.id === id),
        },

        Mutation: {
          upvotePost(_, { postId }) {
            const post = posts.find((post) => post.id === postId);
            if (!post) {
              throw new Error(`Couldn't find post with id ${postId}`);
            }
            post.votes += 1;
            return post;
          },
        },

        Author: {
          posts(author) {
            return posts.filter((post) => post.authorId === author.id);
          },
        },

        Post: {
          author(post) {
            return authors.find((author) => author.id === post.authorId);
          },
        },
      },
    };
  }
);

export default extendSchemaPlugin;
