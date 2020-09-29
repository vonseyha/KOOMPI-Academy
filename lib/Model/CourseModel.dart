class Course {
  Course(
      this.id,
      this.org_id,
      this.title,
      this.privacy,
      this.price,
      this.categories,
      this.thumbnail,
      this.description,
      this.owner_id,
      this.fullname,
      this.views,
      );

  final String id;
  final String org_id;
  final String title;
  final String privacy;
  final int price;
  final List categories;
  final String thumbnail;
  final String description;
  final String owner_id;
  final String fullname;
  final int views;

  getId() => this.id;
  getOrg_id() => this.org_id;
  getTitle() => this.title;
  getPrivacy() => this.privacy;
  getPrice() => this.price;
  getCategories() => this.categories;
  getThumbnail() => this.thumbnail;
  getDescription() => this.description;
  getOwner_id() => this.owner_id;
  getFullname() => this.fullname;
  getView() => this.views;
}
