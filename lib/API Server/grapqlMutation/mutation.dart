class QueryMutation {
  String addCourse(String org_id, String title, String privacy,int price, String categories, String thumbnail, String description, String owner_id) {
    return """
      mutation{
          create_course(
            org_id: "$org_id", 
            title: "$title", 
            privacy: "$privacy", 
            price: $price,
            categories:"$categories",
            thumbnail:"$thumbnail",
            description:"$description",
            owner_id:"$owner_id",
            ){
            message
            status
          }
      }
    """;
  }

  String getAll(){
   return """ 
    query {
      courses{
       		id
          org_id
          title
          price
          privacy
          categories
          thumbnail
          description
          owner_id
            user{
              fullname
              avatar
            }
      }
  }
    """;
  }

  String deleteCourse(id){
    return """
      mutation{
        delete_course(course_id: "$id"){
          message
        }
      } 
    """;
  }

  String editCourse(
    String id, 
    String name, 
    String lastName, 
    int age){
    return """
      mutation{
          update_course(
            org_id: "$id", 
            title: "$name", 
            privacy: "$lastName", 
            price: $age,
            categories:"កាលវិភាគ"
            thumbnail:"public/123.jpg"
            description:"flutter is good for build application"
            owner_id:"5d5238fdb478d918d8b8af18"){
            message
          }
      }    
     """;
  }
}