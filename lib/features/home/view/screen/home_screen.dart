import 'package:flutter/material.dart';

import '../widget/category_list.dart';
import '../widget/product_card.dart';
import '../widget/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(labelText: 'Search in Market'),
          const SizedBox(height: 30),
          Image.asset('image/market.jpeg'),
          const SizedBox(height: 16),
          Text('Popular Categories', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          CategoriesList(),
          const SizedBox(height: 16),
          Text('Recently Added', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
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
