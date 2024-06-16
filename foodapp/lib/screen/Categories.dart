import 'package:flutter/material.dart';
import 'package:foodapp/models/Food_Categories_Model.dart';
import 'package:foodapp/models/category_model.dart';
import 'package:foodapp/screen/detail_page.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:foodapp/screen/widget/bottom_Container.dart';

class Categories extends StatelessWidget {
  final List<FoodCategoriesModel> list;
  Categories({@required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: GridView.count(
        shrinkWrap: false,
        primary: false,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: list
            .map(
              (e) => BottomContainer(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      ),
                    );
                  },
                  image: e.image,
                  price: e.price,
                  name: e.name),
            )
            .toList(),
      ),
    );
  }
}
