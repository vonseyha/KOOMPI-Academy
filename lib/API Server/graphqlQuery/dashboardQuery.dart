class QueryGraphQL{

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
          views
            user{
              fullname
              avatar
            }
      }
  }
    """;
  }

    String getSections(String course_Id){
      return """
          query{
            sections(course_id:"$course_Id"){
              id
              course_id
              no
              title
              message
              points{
                id
                no
                title
                video_link
                preview
                section_id
                message
              }
            }
          }
        """;
    } 

    String getSectionId(String course_id){
      return 
      """
      query{
        sections(course_id:"$course_id"){
          id
          title
        }
      }
      """;
    }
}