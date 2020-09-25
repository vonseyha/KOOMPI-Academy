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
      }
    }
    """;
  }
}
