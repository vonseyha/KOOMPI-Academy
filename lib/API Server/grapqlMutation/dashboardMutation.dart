import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> dashboardC = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://academybackend.koompi.com/private/api'),
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

String createCourse = """
  mutation (
    \$org_id: String!,
    \$title: String!,
    \$price: Float!,
    \$privacy: String!,
    \$categories: [String!],
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
