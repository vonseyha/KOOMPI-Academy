class QueryData {
  String getProfileSection() {
    return """
    {
      users{
        id
        fullname
        email
        avatar
      }
    }
    """;
  }

  String getVideoSection() {
    return """
    {
      courses{
        id
        title
        feature_image
        views
        user{
          fullname
          avatar
        }
      }
    }
    """;
  }

  String getLinkVieo(String course_id){
       return 
       """ 
            query{
              sections(course_id:"5ef1a03e7cb812452191ba4d"){
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
}
