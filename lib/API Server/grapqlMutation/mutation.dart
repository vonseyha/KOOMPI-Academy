class QueryMutation {
  String addCourse(
      String org_id,
      String title,
      String privacy,
      int price,
      String categories,
      String thumbnail,
      String description,
      String owner_id) {
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

  String getAll() {
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

  String deleteCourse(String id) {
    return """
      mutation{
        delete_course(course_id: "$id"){
          message
        }
      } 
    """;
  }

  String updateCourse(
    String id,
    String title,
    String privacy,
    int price,
    String categories,
    String thumbnail,
    String description,
    String org_id,
  ) {
    return """
      mutation{
          update_course(
            id: "$id"
            org_id: "$org_id", 
            title: "$title", 
            privacy: "$privacy", 
            price: $price,
            categories:"$categories"
            thumbnail:"$thumbnail"
            description:"$description"
          ){
            message
          }
      }    
     """;
  }

  String createSection(String course_id ,int no,String title) {
    return """
      mutation{
        create_section(
          course_id:"$course_id",
          no:"$no",
          title:"$title"
        ){
          message
        }
      } 
    """;
  }

  String updateSection(String id ,int no,String title) {
    return """
      mutation{
      update_section(
        id:"$id",
        no:$no,
        title:"$title",
      ){
        message
      }
    }
    """;
  }

  String deleteSection(String id) {
    return """
      mutation{
        delete_section(
          id:"$id"
        ){
          message
        }
      } 
    """;
  }

  String createPoint(String section_id,int no,String title,String video_link) {
    return """
      mutation{
        create_point(
          section_id:"$section_id",
          no:"$no",
          title:"$title",
          video_link:"$video_link",
          preview:false
        ){
          message
        }
      } 
    """;
  }

  String updatePoint(String id,int no,title,String video_link) {
    return """
      mutation {
        update_point(
          id:"$id",
          no:"$no",
          title:"$title",
          video_link:"$video_link"
        ){
          message
        }
      }
    """;
  }

  String deletePoint(String id) {
    return """
     mutation{
        delete_point(
          id:"$id"
        ){
          message
        }
      }
    """;
  }


}
