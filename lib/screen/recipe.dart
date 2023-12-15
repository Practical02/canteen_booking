import 'package:canteen_booking/consent/navigation.dart';
import 'package:flutter/material.dart';
import 'package:canteen_booking/consent/colors.dart';

class OrderingScreen extends StatefulWidget {
  const OrderingScreen({super.key});

  @override
  _OrderingScreenState createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'images/dinner3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        width: 80,
                        height: 4,
                        color: font,
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                    radius: 18,
                    child: Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: font,
                    ),
                  ),
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                  radius: 18,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: font,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biriyani',
                      style: TextStyle(
                        fontSize: 24,
                        color: font,
                        fontFamily: 'ro',
                      ),
                    ),
                    Text(
                      'Rs. 200',
                      style: TextStyle(
                        fontSize: 24,
                        color: font,
                        fontFamily: 'ro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset(
                  'images/dinner3.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 18,
                        color: font,
                        fontFamily: 'ro',
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: font,
                            fontFamily: 'ro',
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to handle the order
                  // You can use the selected quantity and perform necessary actions
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Navigation())));
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ro',
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
