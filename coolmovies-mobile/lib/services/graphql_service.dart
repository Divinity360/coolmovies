import 'dart:developer';

import 'package:coolmovies/models/movies.dart';
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
      log(AllMovies.fromJson(res['allMovies']).toJson().toString());
      log(res['allMovies'].toString());
      return AllMovies.fromJson(res['allMovies']);
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
