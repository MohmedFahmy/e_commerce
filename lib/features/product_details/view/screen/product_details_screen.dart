import 'package:ecommerce_app/core/function/custom_appbar.dart';
import 'package:ecommerce_app/core/widget/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/app_colors.dart';
import '../widget/comment_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Product Name'),
      body: ListView(
        children: [
          CustomCachedImage(
            image:
                "https://img.freepik.com/premium-psd/3d-rendering-minimalist-interior-background-podium-product-display_285867-425.jpg?w=826",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Name', style: TextStyle(fontSize: 20)),
                    Text('price', style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('3 ', style: TextStyle(fontSize: 18)),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                    Icon(Icons.favorite, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 20),
                Text('Product Description', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder:
                      (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Type Your Feedback',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send, color: AppColors.kPrimaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.kBordersideColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [Text('Comments', style: TextStyle(fontSize: 20))],
                ),
                SizedBox(height: 10),
                CommentList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
