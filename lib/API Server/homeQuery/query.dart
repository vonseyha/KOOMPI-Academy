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
}
