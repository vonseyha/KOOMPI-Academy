import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConf {
  static HttpLink httpLink =
      HttpLink(uri: "https://academybackend.koompi.com/private/api");

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject)));

  GraphQLClient clientToQuery() {
    return GraphQLClient(
        link: httpLink,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject));
  }
}
