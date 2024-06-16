import 'package:flutter/material.dart';

class FoodCategoriesModel {
  final String image;
  final String name;
  final int price;
  FoodCategoriesModel(
      {@required this.price, @required this.image, @required this.name});
}
