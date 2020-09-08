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
String CREATE_COURSE = """
  mutation(
    \$title: String!
    \$owner_id: ID!
    \$category_name: String!
    \$status: String!
    \$tags: [String]
    \$price: Float!
    \$description: String!
    \$feature_image: String!
  ) {
    create_course(
      title: \$title
      feature_image: \$feature_image
      owner_id: \$owner_id
      category_name: \$category_name
      status: \$status
      tags: \$tags
      price: \$price
      description: \$description
    ) {
      title
      feature_image
      owner_id
      category_name
      status
      tags
      price
      description
      user {
        fullname
      }
      category {
        title
      }
    }
  }
""";

String UPDATE_COURSE = """
  mutation(
    \$id: ID!
    \$title: String!
    \$category_name: String!
    \$status: String!
    \$tags: [String]
    \$price: Float!
    \$description: String!
    \$feature_image: String!
  ) {
    update_course(
      id: \$id
      title: \$title
      category_name: \$category_name
      status: \$status
      tags: \$tags
      price: \$price
      description: \$description
      feature_image: \$feature_image
    ) {
      message
    }
  }
""";

String DELETE_COURSE = """
  mutation(\$course_id: ID!) {
    delete_course(course_id: \$course_id) {
      title
    }
  }
""";

String CREATE_SECTION = """
  mutation(\$no: String!, \$title: String!, \$course_id: ID!) {
    create_section(no: \$no, title: \$title, course_id: \$course_id) {
      no
      title
      course {
        title
      }
    }
  }
""";

String UPDATE_SECTION = """
  mutation(\$no: String!, \$title: String!, \$id: ID!) {
    update_section(no: \$no, title: \$title, id: \$id) {
      message
    }
  }
""";

String DELETE_SECTION = """
  mutation(\$id: ID!) {
    delete_section(id: \$id) {
      message
    }
  }
""";

String CREATE_POINT = """
  mutation(
    \$no: String!
    \$title: String!
    \$section_id: ID!
    \$video_link: String!
    \$preview: Boolean
  ) {
    create_point(
      no: \$no
      title: \$title
      section_id: \$section_id
      video_link: \$video_link
      preview: \$preview
    ) {
      no
      title
      video_link
      preview
      section {
        id
        title
      }
    }
  }
""";

String UPDATE_POINT = """
  mutation(\$no: String!, \$title: String!, \$id: ID!, \$video_link: String!) {
    update_point(no: \$no, title: \$title, id: \$id, video_link: \$video_link) {
      message
    }
  }
""";

String DELETE_POINT = """
  mutation(\$id: ID!) {
    delete_point(id: \$id) {
      message
    }
  }
""";
