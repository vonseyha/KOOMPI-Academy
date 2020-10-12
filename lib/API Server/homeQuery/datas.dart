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

class LinkVideo{
  final String idS;
  final String course_id;
  final String noS;
  final String titleS;
  final String messageS;
  final String idP;
  final String noP;
  final String titleP;
  final String video_link;
  final String preview;
  final String section_id;
  final String messageP;

  LinkVideo(this.idS, this.course_id, this.noS, this.titleS, this.messageS, this.idP, this.noP, this.titleP, this.video_link, this.preview, this.messageP, this.section_id);
  getSectionId() =>this.idS;
  getSectionCourseId()=>this.course_id;
  getSectionNo() =>this.noS;
  getSectionTitle() =>this.titleS;
  getSectionMessage() => this.messageS;
  getPointId() =>this.idP;
  getPointNo() =>this.noP;
  getPointTitle() =>this.titleP;
  getPointVideoLink() =>this.video_link;
  getPointPreview() => this.preview;
  getPointSectionId() => this.section_id;
  getPointMessage() => this.messageP;
}

