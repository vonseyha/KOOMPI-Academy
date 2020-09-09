import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> clientdashboard = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://localhost:6001/private/api'),
  ),
);

//----------------------------- Part Dashboard Mutation-----------------------//

// mutation{
//   create_course(
//     org_id:"5f432977da0863337654d38c"
//     title:"flutter Course"
//     price:30
//     privacy:"Public"
//     categories:"កាលវិភាគ"
//     thumbnail:"public/upload/123.jpg"
//     description:"flutter is good for build application"
//     owner_id:"5d5238fdb478d918d8b8af18"
//   ){
//     message
//     status
//   }
// }

String createCourse = r"""
  mutation (
    $org_id1: String!,
    $title1: String!,
    $price1: Int!,
    $privacy1: String!,
    $categories1: [String!]!,
    $thumbnail1: String!,
    $description1: String!,
    $owner_id1: String!
  ) {
    create_course(
      org_id: $org_id1,
      title: $title1,
      price: $price1,
      privacy: $privacy1,
      categories: $categories1,
      thumbnail: $thumbnail1,
      description: $description1,
      owner_id: $owner_id1
    ) {
      message
      status
    }
  }
""";

// String UPDATE_COURSE = """
//   mutation(
//     \$id: ID!
//     \$title: String!
//     \$category_name: String!
//     \$status: String!
//     \$tags: [String]
//     \$price: Float!
//     \$description: String!
//     \$feature_image: String!
//   ) {
//     update_course(
//       id: \$id
//       title: \$title
//       category_name: \$category_name
//       status: \$status
//       tags: \$tags
//       price: \$price
//       description: \$description
//       feature_image: \$feature_image
//     ) {
//       message
//     }
//   }
// """;

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
