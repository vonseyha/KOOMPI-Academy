import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
  ),
);

//----------------------------- Register -----------------------//
String CREATE_USER = """
  mutation(\$fullname: String!, \$email: String!, \$password: String!) {
    create_user(fullname: \$fullname, email: \$email, password: \$password) {
      fullname
      email
      role {
        title
      }
    }
  }
""";
