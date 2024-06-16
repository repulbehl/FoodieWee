import 'package:flutter/material.dart';
import 'package:foodapp/provider/my_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget cartItem({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
    @required Function onTap,
  }) {
    return Row(
      children: [
        Container(
          height: 180,
          width: 180,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " burger is awesome ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "\₹$price",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        // IconButton(
                        //     onPressed: () {
                        //       quantity--;
                        //     },
                        //     icon: Icon(Icons.remove_circle_outline,
                        //         color: Colors.white, size: 26)),
                        SizedBox(width: 10),
                        Text(
                          "$quantity orders",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        // IconButton(
                        //     onPressed: () {
                        //       quantity++;
                        //     },
                        //     icon: Icon(Icons.add_circle_outline,
                        //         color: Colors.white, size: 26)),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.close, color: Colors.white))
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalPrice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 58,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\₹$total",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              "Booked",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: () {
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}
