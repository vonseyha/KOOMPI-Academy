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
  {'name': 'sala', 'iconPath': 'images/knowledge.svg','svg':"images/art.svg"},
  {'name': 'science', 'iconPath': 'images/idea.svg','svg':"images/science.svg"},
  {'name': 'technology', 'iconPath': 'images/brain.svg','svg':"images/technology.svg"},
  {'name': 'engineering', 'iconPath': 'images/prototype.svg','svg':"images/engeneering.svg"},
  {'name': 'art', 'iconPath': 'images/art.svg','svg':"images/arts.svg"},
  {'name': 'mathermatic', 'iconPath': 'images/formula.svg','svg':"images/mathermatic.svg"},
  {'name': 'hina', 'iconPath': 'images/princess.svg','svg':"images/hina.svg"}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.bookOpen, 'title': 'My Learning'},
  {'icon': Icons.date_range, 'title': 'Schedule'},
  {'icon': Icons.favorite, 'title': 'Favorites'},
  {'icon': Icons.mail, 'title': 'Messages'},
];
