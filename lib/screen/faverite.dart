import 'package:flutter/material.dart';
import 'package:canteen_booking/consent/appbar.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Replace the following with your data model
                // Example: FoodItem foodItem = orderedFoods[index];
                String foodName = 'Biriyani';
                String orderStatus =
                    getOrderStatus(index); // Replace with your logic

                return ListTile(
                  title: Text(foodName),
                  subtitle: Text('Order Status: $orderStatus'),
                  // Add more information as needed
                );
              },
              childCount: 2, // Replace with the actual count of ordered foods
            ),
          ),
        ],
      ),
    );
  }

  // Replace this method with your logic to determine order status based on the index
  String getOrderStatus(int index) {
    // Example logic: alternate between 'Failed', 'Preparing', 'Ready'
    List<String> orderStatuses = ['Failed', 'Preparing', 'Ready'];
    return orderStatuses[index % orderStatuses.length];
  }
}
