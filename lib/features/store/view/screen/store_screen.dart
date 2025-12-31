import 'package:flutter/material.dart';

import '../../../home/view/widget/product_card.dart';
import '../../../home/view/widget/search_text_field.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Welcome To Our Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          CustomSearchField(labelText: 'Search in Store'),
          const SizedBox(height: 30),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCard();
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
