class Datas {
  final String id;
  final String fullname;
  final String email;
  final String avatar;

  Datas(this.id, this.fullname, this.email, this.avatar);

  getId() => this.id;
  getFullname() => this.fullname;
  getEmail() => this.email;
  getAvatar() => this.avatar;
}

class VideoDatas {
  final String id;
  final String title;
  final String feature_image;
  final int views;
  final String fullname;
  final String avatar;

  VideoDatas(this.id, this.title, this.feature_image, this.views, this.fullname,
      this.avatar);

  getId() => this.id;
  getTitle() => this.title;
  getImage() => this.feature_image;
  getView() => this.views;
  getFullname() => this.fullname;
  getAvatar() => this.avatar;
}

class LinkVideo {
  final String video_link;

  LinkVideo(this.video_link);

  getPointVideoLink() => this.video_link;
}
