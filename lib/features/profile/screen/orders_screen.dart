import 'package:ecommerce_app/core/function/custom_appbar.dart';
import 'package:ecommerce_app/features/home/view/widget/product_card.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'My Orders'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => ProductCard(),
          itemCount: 10,
        ),
      ),
    );
  }
}
