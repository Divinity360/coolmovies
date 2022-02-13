import 'dart:developer';

import 'package:coolmovies/models/movies.dart';
import 'package:coolmovies/models/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static Future<AllMovies?> fetchAvailableMovies(BuildContext context) async {
    const data = r"""
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
              }
            }
          }
        """;
    final res = await query(context, document: data);
    if (res != null) {
      return AllMovies.fromJson(res['allMovies']);
    }
    return null;
  }

  static Future<AllReviews?> fetchReviews(BuildContext context) async {
    const data = r"""
          query AllMovies {
            allMovieReviews{
              nodes {
                userReviewerId
                body
                id
                movieId
                nodeId
                rating
                title
              }
            }
          }
        """;
    final res = await query(context, document: data);
    if (res != null) {
      log(res.toString());
      return AllReviews.fromJson(res['allMovieReviews']);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> query(BuildContext context,
      {required String document}) async {
    var client = GraphQLProvider.of(context).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql(document),
    ));
    return result.data;
  }
}
