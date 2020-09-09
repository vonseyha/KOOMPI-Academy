import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> clientdashboard = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://academybackend.koompi.com/private/api'),
  ),
);
//----------------------------- Part Dashboard Mutation-----------------------//

String GET_USER = """
  query(\$user_id:ID!){
    user(id:\$user_id){
      fullname
      email
      avatar
      id
      bio
      created_at
      role {
        id
        title
      }
    }
  }
""";

String GET_USERS = """
  {
    users {
      fullname
      email
      role {
        title
      }
      confirmed
    }
  }
""";

String GET_COURSES_BY_USER = """
   query(\$owner_id: ID!) {
    courses_by_owner(owner_id: \$owner_id) {
      id
      title
      feature_image
      owner_id
      category_name
      status
      tags
      price
      description
      created_at
      views
      category {
        title
      }
      user {
        fullname
        avatar
      }
    }
  }
""";

String GET_SECTION = """
  query(\$course_id: ID!) {
    sections(course_id: \$course_id) {
      title
      no
      id
      points {
        id
        title
        no
        video_link
      }
    }
  }
""";

String GET_SECTION_BY_ID = """
  query(\$id: ID!) {
    section_by_id(id: \$id) {
      title
      nos
      id
    }
  }
""";

String GET_POINT_BY_ID = """
  query(\$id: ID!) {
    point_by_id(id: \$id) {
      title
      no
      id
      video_link
    }
  }
""";
