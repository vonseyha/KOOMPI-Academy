//---------------------------- Part Dashboard Mutation-----------------------//
//owner_id:"5d5238fdb478d918d8b8af18"
String getCourse = r"""
   query GetContinent($owner_id : String!){
    courses_by_owner(owner_id:$owner_id) {
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

String getAll = """
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

