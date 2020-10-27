import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'dart:io';

String typenameDataIdFromObject(Object object) {
    if (object is Map<String, Object> &&
        object.containsKey('__typename') &&
        object.containsKey('id')) {
      return "${object['__typename']}/${object['id']}";
    }
    return null;
  }
  
class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
     uri: Platform.isAndroid ? 'http://192.168.1.145:6001/private/api': 'http://localhost:6001/private/api',
  );
      // uri: "http://127.0.0.1:6001/private/api",
      // uri: "http://10.0.2.2:6001/private/api",
       // uri: "http://192.168.1.26:6001/private/api",
       //'http://192.168.1.145:6001/private/api'  for koompi attacks
       //http://192.168.43.210:6001/private/api for my phone 

  ValueNotifier<GraphQLClient> linkclient = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}