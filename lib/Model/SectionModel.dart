class Section {
  Section(
      this.section_id,
      this.section_courseid,
      this.section_no,
      this.section_title,
      this.section_message,
      this.point_id,
      this.point_no,
      this.point_title,
      this.point_videoLink,
      this.point_preview,
      this.point_sectionid,
      this.point_message,
      this.hello
      );

  final String section_id;
  final String section_courseid;
  final String section_no;
  final String section_title;
  final String section_message;
  final String point_id;
  final String point_no;
  final String point_title;
  final String point_videoLink;
  final bool point_preview;
  final String point_sectionid;
  final String point_message;

  final List hello;

  getSectionId() => this.section_id;
  getSectionCourseId() => this.section_courseid;
  getSectionNo() => this.section_no;
  getSectionTitle() => this.section_title;
  getSectionMessage() => this.section_message;
  getPointId() => this.point_id;
  getPointNo() => this.point_no;
  getPointTitle() => this.point_title;
  getPointVideoLink() => this.point_videoLink;
  getPointPreview() => this.point_preview;
  getPointSectionId() => this.point_sectionid;
  getPointMessage() => this.point_message;
}
