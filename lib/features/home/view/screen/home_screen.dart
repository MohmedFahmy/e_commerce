import 'package:ecommerce_app/features/home/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/product_model/product_model.dart';
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
          BlocProvider(
            create: (context) => HomeCubit()..getProducts(),
            child: BlocConsumer<HomeCubit, HomeCubitState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                List<ProductModel> products =
                    context.read<HomeCubit>().products;
                return state is GetDataLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is GetDataError
                    ? const Center(child: Text('Error fetching data'))
                    : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductCard();
                      },
                      itemCount: products.length,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
