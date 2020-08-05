import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGrey = Colors.grey[600];
Color primaryWhite = Colors.white;
var color = 0xff453658;

///for GridView

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Sala', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Science', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Technology', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Engineering', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Art', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Mathematics', 'iconPath': 'images/koompi_logos.png'},
  {'name': 'Hina', 'iconPath': 'images/koompi_logos.png'}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.bookOpen, 'title': 'My Courses'},
  {'icon': Icons.date_range, 'title': 'Schedule'},
  {'icon': Icons.favorite, 'title': 'Favorites'},
  {'icon': Icons.mail, 'title': 'Messages'},
  {'icon': FontAwesomeIcons.solidUserCircle, 'title': 'Profile'},
];
