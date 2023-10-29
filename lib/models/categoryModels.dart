import 'package:flutter/material.dart';
class CategoryModel{
  String name;
  String iconpath;
  Color boxcolor;
  CategoryModel({
    required this.name,
    required this.iconpath,
    required this.boxcolor
});
    static List<CategoryModel> getCategories(){
    List<CategoryModel> categories=[];
    categories.add(
      CategoryModel(name: "Pizza", iconpath: "assets/pizza.svg", boxcolor: const Color(0xff92A3FD))
    );
    categories.add(
        CategoryModel(name: "Burger", iconpath: "assets/burger.svg", boxcolor: const Color(0xff92A3A3))
    );
    categories.add(
        CategoryModel(name: "Salad", iconpath: "assets/salad.svg", boxcolor: const Color(0xff4a65ce))
    );
    categories.add(
        CategoryModel(name: "Pizza", iconpath: "assets/pizza.svg", boxcolor: const Color(0xff92A3FD))
    );
    categories.add(
        CategoryModel(name: "Burger", iconpath: "assets/burger.svg", boxcolor: const Color(0xff92A3A3))
    );
    categories.add(
        CategoryModel(name: "Salad", iconpath: "assets/salad.svg", boxcolor: const Color(0xff4a65ce))
    );
    return categories;
  }
}