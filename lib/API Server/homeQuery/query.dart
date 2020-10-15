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

  String getLinkVieo() {
    return """ 
            query getLinkVideo(\$course_id:ID!){
              sections(course_id:\$course_id){
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
