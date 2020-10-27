
class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImagePath(String getImagepath){
    imagePath = getImagepath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImagePath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("To KOOMPI Academy",);
  sliderModel.setTitle("Welcome");
  sliderModel.setImagePath("images/koompi_splash.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "With carefully selected materials, all curated for a convenient at-home learning, KOOMPI Academy can be accessed by everyone for free with contents created exclusively for Cambodian students. ");
  sliderModel.setTitle("ABOUT");
  sliderModel.setImagePath("images/splash22.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc( "Producing quality tools is only one step towards KOOMPI's mission. This is why we developed KOOMPI Academy, a technology-oriented educational project that aims to provide learners with three resources: tools, courses, and mentors.");
  sliderModel.setTitle("GOAL");
  sliderModel.setImagePath("images/goal.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  
  return slides;
}
