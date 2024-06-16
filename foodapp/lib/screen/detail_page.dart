import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/provider/my_provider.dart';
import 'package:foodapp/screen/cart_page.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final int price;
  final String name;

  DetailPage({@required this.image, @required this.price, @required this.name});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: CircleAvatar(
                  radius: 84,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff3e3e3e),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      Text("Eat Drink Love at 10% discount",
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity--;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("$quantity",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                          Text("\₹${widget.price}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                        ],
                      ),
                      Text("Descripton",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      Text(
                          "Foodies welcome. The only thing we love more than food is you! There’s no platform like foodiee wee. Best of the best. We have got something for everyone.Good food and great vibes.",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color(0xff2b2b2b),
                          onPressed: () {
                            provider.addToCart(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: quantity,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
