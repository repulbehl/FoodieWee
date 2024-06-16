import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/Food_Categories_Model.dart';
import 'package:foodapp/models/category_model.dart';
import 'package:foodapp/models/food_model.dart';
import 'package:foodapp/provider/my_provider.dart';
import 'package:foodapp/screen/Categories.dart';
import 'package:foodapp/screen/cart_page.dart';
import 'package:foodapp/screen/detail_page.dart';
import 'package:foodapp/screen/login_page.dart';
import 'package:foodapp/screen/welcome_page.dart';
import 'package:foodapp/screen/widget/bottom_Container.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/models/category_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> burgerlist = [];
  List<CategoriesModel> recipeslist = [];
  List<CategoriesModel> pizzalist = [];
  List<CategoriesModel> drinklist = [];
  List<CategoriesModel> allmeallist = [];

//////////////foodlist////////
  List<FoodModle> foodlist = [];

  List<FoodCategoriesModel> burgerCategorieslist = [];
  List<FoodCategoriesModel> topRecipeCategorieslist = [];
  List<FoodCategoriesModel> topPizzaCategorieslist = [];
  List<FoodCategoriesModel> topDrinksCategorieslist = [];
  List<FoodCategoriesModel> topMealCategorieslist = [];

  Widget categoriesContainer({
    @required Function onTap,
    @required String image,
    @required String name,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image)),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget drawerItem(
      {@required String name,
      @required IconData icon,
      @required Function action}) {
    return ListTile(
      onTap: action,
      leading: Icon(icon, color: Colors.white),
      title: Text(name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          )),
    );
  }

  Widget burger() {
    return Row(
      children: burgerlist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategorieslist,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget recipe() {
    return Row(
      children: recipeslist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: topRecipeCategorieslist,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzalist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: topPizzaCategorieslist,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget drinks() {
    return Row(
      children: drinklist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: topDrinksCategorieslist,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget meal() {
    return Row(
      children: allmeallist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: topMealCategorieslist,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

/////////////////////////////single food//////////////////

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    //1
    provider.getBurgerCategory();
    burgerlist = provider.throwBurgerList;
    //2
    provider.getRecipeCategory();
    recipeslist = provider.throwRecipeList;
    //3
    provider.getpizzaCategory();
    pizzalist = provider.throwPizzaList;
    //4
    provider.getDrinkCategory();
    drinklist = provider.throwDrinkList;
    //5
    provider.getAllmealCategory();
    allmeallist = provider.throwAllmealList;
////////////single food/////////
    provider.getFoodList();
    foodlist = provider.throwFoodModelList;

    provider.getBugerCategoriesList();
    burgerCategorieslist = provider.throweBurgerCategoriesList;

    provider.getrecipeCategoriesList();
    topRecipeCategorieslist = provider.throweRecipeCategoriesList;

    provider.getpizzaCategoriesList();
    topPizzaCategorieslist = provider.throwPizzaCategoriesList;

    provider.getdrinksCategoriesList();
    topDrinksCategorieslist = provider.throwDrinksCategoriesList;

    provider.getmealCategoriesList();
    topMealCategorieslist = provider.throwMealCategoriesList;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Color(0xff3a3e3e),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/17.jpg'),
                  )),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/6.jpg'),
                  ),
                  accountName: Text("Repul Behl "),
                  accountEmail: Text("repulbehl9@gmail.com"),
                ),
                drawerItem(name: "Profile", icon: Icons.person, action: null),
                drawerItem(
                    name: "Cart",
                    icon: Icons.shopping_cart,
                    action: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }),
                drawerItem(name: "Order", icon: Icons.shop, action: null),
                drawerItem(name: "About", icon: Icons.info, action: null),
                Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text("Communicate",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
                drawerItem(name: "Change", icon: Icons.lock, action: null),
                drawerItem(
                    name: "Log Out",
                    icon: Icons.logout,
                    action: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                          (route) => false);
                    }),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          // jasspreet bhaji code
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         FirebaseAuth.instance.signOut();
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => LoginPage()),
          //         );
          //       },
          //       icon: Icon(Icons.ac_unit_rounded))
          // ],
          // jaspreet bhaji code finish

          elevation: 0.0,
          leading: Icon(Icons.sort),
          actions: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/6.jpg'),
              ),
            )
          ],
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                    //                  contentPadding: EdgeInsets.zero,
                    hintText: "Search Food",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Color(0xff3a3e3e),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  burger(),
                  recipe(),
                  pizza(),
                  drinks(),
                  meal(),
                  // categoriesContainer(image: 'images/11.jpg', name: 'All'),
                  // categoriesContainer(image: 'images/1.jpg', name: 'Burger'),
                  // categoriesContainer(image: 'images/9.jpg', name: 'Recipes'),
                  // categoriesContainer(image: 'images/5.jpg', name: 'Pizza'),
                  // categoriesContainer(image: 'images/10.png', name: 'Drink'),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              // height: 100,
              child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: foodlist
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
                      .toList()

//                children: [
                  // bottomContainer(
                  //   image: 'images/6.png',
                  //   name: 'Burger',
                  //   price: 25,
                  // ),
                  // bottomContainer(
                  //   image: 'images/8.jpg',
                  //   name: 'Pizaa',
                  //   price: 150,
                  // ),
                  // bottomContainer(
                  //   image: 'images/14.png',
                  //   name: 'Sandwich',
                  //   price: 40,
                  // ),
                  // bottomContainer(
                  //   image: 'images/15.jpg',
                  //   name: 'Full Meal',
                  //   price: 60,
                  // ),
//                ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}
