import 'dart:convert';

class CourseImage {
    CourseImage({
        this.fileName,
        this.filePath,
    });

    String fileName;
    String filePath;

    factory CourseImage.fromJson(Map<String, dynamic> json) => CourseImage(
        fileName: json["fileName"],
        filePath: json["filePath"],
    );

    Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "filePath": filePath,
    };
}