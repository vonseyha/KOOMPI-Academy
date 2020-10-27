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

  // ------------------------------------ Query fetch data of contents of course ------------------------------------------//
  String getContentCourse(String courseID) {
    return """
      query{
      sections(course_id:"$courseID"){
        id
        no
        title
        points{
          id
          no
          title
          video_link
          section_id
        }
      }
    }
    """;
  }

  String getInitVideo(String courseID) {
    return """
      query{
      sections(course_id:"$courseID"){
        points{
          video_link
        }
      }
    }
    """;
  }

  // ------------------------------------ Query fetch data of overview of course ------------------------------------------//
  String getOverviewCourse(String courseTitle) {
    return """
    query{
      courses_by_search(search:"$courseTitle"){
        id
        description
      }
    }
    """;
  }

// ------------------------------------ Query fetch course by categories ------------------------------------------//
  String getCourseByCategories(String categoryName) {
    return """
    query{
      courses_by_category(query:"$categoryName"){
            id
            title
            feature_image
            category_name
            views
            user{
              fullname
              avatar
            } 
      }
    }
    """;
  }

  // -------------------------------------- Query fetch course by search ---------------------------------------------//
  String getCourseBySearch(String query){
    return 
    """
      query{
        courses_by_search(search:""){
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

}
