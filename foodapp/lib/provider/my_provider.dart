import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/models/Food_Categories_Model.dart';
import 'package:foodapp/models/cart_model.dart';
import 'package:foodapp/models/category_model.dart';
import 'package:foodapp/models/food_model.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModel> burgerList = [];
  CategoriesModel burgerModle;
  Future<void> getBurgerCategory() async {
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('KCDj8a7nJUg9VAf2hFc2')
        .collection('burgur')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModle = CategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
      );
      //print(burgerModle.name);
      newBurgerList.add(burgerModle);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get throwBurgerList {
    return burgerList;
  }

  ///////////2nd category/////////////////
  List<CategoriesModel> recipeList = [];
  CategoriesModel recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategoriesModel> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('KCDj8a7nJUg9VAf2hFc2')
        .collection('Recipie')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModle = CategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
      );
      //print(recipeModle.name);
      newRecipeList.add(recipeModle);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }

  ////////////3rd category//////////////////////
  List<CategoriesModel> pizzaList = [];
  CategoriesModel pizzaModle;
  Future<void> getpizzaCategory() async {
    List<CategoriesModel> newPizaaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('KCDj8a7nJUg9VAf2hFc2')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModle = CategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
      );
      //print(pizzaModle.name);
      newPizaaList.add(pizzaModle);
      pizzaList = newPizaaList;
    });
    notifyListeners();
  }

  get throwPizzaList {
    return pizzaList;
  }

  /////////////////////////4th category//////////////
  List<CategoriesModel> drinkList = [];
  CategoriesModel drinkModle;
  Future<void> getDrinkCategory() async {
    List<CategoriesModel> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('KCDj8a7nJUg9VAf2hFc2')
        .collection('Drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModle = CategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
      );
      //print(drinkModle.name);
      newDrinkList.add(drinkModle);
      drinkList = newDrinkList;
    });
    notifyListeners();
  }

  get throwDrinkList {
    return drinkList;
  }

  ////////////5th category////////
  List<CategoriesModel> allmealList = [];
  CategoriesModel allmealModle;
  Future<void> getAllmealCategory() async {
    List<CategoriesModel> newAllmealList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('KCDj8a7nJUg9VAf2hFc2')
        .collection('All')
        .get();
    querySnapshot.docs.forEach((element) {
      allmealModle = CategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
      );
      //  print(allmealModle.name);
      newAllmealList.add(allmealModle);
      allmealList = newAllmealList;
    });
    notifyListeners();
  }

  get throwAllmealList {
    return allmealList;
  }

//////////////////////////////  Single Food item ///////////////////////////////////
  List<FoodModle> foodModelList = [];
  FoodModle foodModel;
  Future<void> getFoodList() async {
    List<FoodModle> newfoodModelList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach((element) {
      foodModel = FoodModle(
          image: element.get('image') ?? "",
          name: element.get('name') ?? "",
          price: element.get('price') ?? "");
      newfoodModelList.add(foodModel);
    });

    foodModelList = newfoodModelList;
    notifyListeners();
  }

  get throwFoodModelList {
    return foodModelList;
  }

  //////////////////BurgerCategory list////////////////

  List<FoodCategoriesModel> burgerCategoriesList = [];
  FoodCategoriesModel burgerCategoriesModel;
  Future<void> getBugerCategoriesList() async {
    List<FoodCategoriesModel> newburgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Foodcategories')
        .doc('cy89O5jOr3VHpEw5eoL9')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModel = FoodCategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
        price: element.get('price') ?? "",
      );
      newburgerCategoriesList.add(burgerCategoriesModel);
      burgerCategoriesList = newburgerCategoriesList;
    });
    print(burgerCategoriesModel.name);
    notifyListeners();
  }

  get throweBurgerCategoriesList {
    return burgerCategoriesList;
  }

  //////////////////Recepi Category list////////////////

  List<FoodCategoriesModel> recipeCategoriesList = [];
  FoodCategoriesModel recipeCategoriesModel;
  Future<void> getrecipeCategoriesList() async {
    List<FoodCategoriesModel> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Foodcategories')
        .doc('cy89O5jOr3VHpEw5eoL9')
        .collection('Recipie')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModel = FoodCategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
        price: element.get('price') ?? "",
      );
      newrecipeCategoriesList.add(recipeCategoriesModel);
      recipeCategoriesList = newrecipeCategoriesList;
    });
    print(recipeCategoriesModel.name);
    notifyListeners();
  }

  get throweRecipeCategoriesList {
    return recipeCategoriesList;
  }

  //////////////////Recepi Category list////////////////

  List<FoodCategoriesModel> pizzaCategoriesList = [];
  FoodCategoriesModel pizzaCategoriesModel;
  Future<void> getpizzaCategoriesList() async {
    List<FoodCategoriesModel> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Foodcategories')
        .doc('cy89O5jOr3VHpEw5eoL9')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModel = FoodCategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
        price: element.get('price') ?? "",
      );
      newPizzaCategoriesList.add(pizzaCategoriesModel);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
    print(pizzaCategoriesModel.name);
    notifyListeners();
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  //////////////////Recepi Category list////////////////

  List<FoodCategoriesModel> drinksCategoriesList = [];
  FoodCategoriesModel drinksCategoriesModel;
  Future<void> getdrinksCategoriesList() async {
    List<FoodCategoriesModel> newDrinksCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Foodcategories')
        .doc('cy89O5jOr3VHpEw5eoL9')
        .collection('Drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinksCategoriesModel = FoodCategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
        price: element.get('price') ?? "",
      );
      newDrinksCategoriesList.add(drinksCategoriesModel);
      drinksCategoriesList = newDrinksCategoriesList;
    });
    print(drinksCategoriesModel.name);
    notifyListeners();
  }

  get throwDrinksCategoriesList {
    return drinksCategoriesList;
  }

//////////////////Meal Category list////////////////

  List<FoodCategoriesModel> mealCategoriesList = [];
  FoodCategoriesModel mealCategoriesModel;
  Future<void> getmealCategoriesList() async {
    List<FoodCategoriesModel> newMealCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Foodcategories')
        .doc('cy89O5jOr3VHpEw5eoL9')
        .collection('meals')
        .get();
    querySnapshot.docs.forEach((element) {
      mealCategoriesModel = FoodCategoriesModel(
        image: element.get('image') ?? "",
        name: element.get('name') ?? "",
        price: element.get('price') ?? "",
      );
      newMealCategoriesList.add(mealCategoriesModel);
      mealCategoriesList = newMealCategoriesList;
    });
    print(mealCategoriesModel.name);
    notifyListeners();
  }

  get throwMealCategoriesList {
    return mealCategoriesList;
  }

//////////////////add to cart //////

  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];
  CartModel cartModel;
  void addToCart({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
  }) {
    cartModel = CartModel(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModel);
    cartList = newCartList;
    print(cartModel.name);
  }

  get throwCartList {
    return cartList;
  }

  int totalPrice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
