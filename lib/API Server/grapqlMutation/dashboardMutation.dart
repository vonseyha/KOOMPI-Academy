import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> dashboardC = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://academybackend.koompi.com/private/api'),
  ),
);

String createCourse = """
  mutation (
    \$org_id: String!,
    \$title: String!,
    \$price: Float!,
    \$privacy: String!,
    \$categories: [String!]!,
    \$thumbnail: String!,
    \$description: String!,
    \$owner_id: String!
  ) {
    create_course(
      org_id: \$org_id,
      title: \$title,
      price: \$price,
      privacy: \$privacy,
      categories: \$categories,
      thumbnail: \$thumbnail,
      description: \$description,
      owner_id: \$owner_id,
    ) {
      message
      status
    }
  }
""";

// mutation{
//   delete_course(course_id:""){
//     message
//   }
// }

// mutation{
//   create_section(
//     course_id:"",no:"",title:"")
//   {
//     message
//   }
// }

// mutation{
//   update_section(id:"",no:"",title:""){
//     message
//   }
// }

// mutation{
//   delete_section(id:""){
//     message
//   }
// }

// mutation{
//   create_point(section_id:"",no:"",title:"",video_link:"",preview:false){
//     message
//   }
// }

// mutation {
//   update_point(id:"",no:"",title:"",video_link:""){
//     message
//   }
// }

// mutation{
//   delete_point(id:""){
//     message
//   }
// }

// mutation{
// 	update_course(id:"",title:"",feature_image:"",category_name:"",status:"",tags:"",price:23,description:"",message){
//     message
//     status
//   }
// }
