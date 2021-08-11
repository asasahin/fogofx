import 'package:flutter/material.dart';

class CourseModel {
  int courseId;
  String courseName;
  String teacher;
  String courseImage;
  late int completionRate;
  late bool isAddedToCart;
    late bool isAddedToFav;


  CourseModel(
      {this.courseId = 0,
      this.courseName = "",
      this.teacher = "",
      this.courseImage = ""
      ,this.isAddedToCart=false,
      this.isAddedToFav=false});

  CourseModel.withCompletionRate(
      {this.courseId = 0,
      this.courseName = "",
      this.teacher = "",
      this.courseImage = "",
      this.completionRate = 0,
      this.isAddedToCart=false,
      this.isAddedToFav=false
      });
}
