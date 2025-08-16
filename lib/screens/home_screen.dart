import 'package:flutter/material.dart';
import 'package:shopeasy/widgets/cart_view.dart';
import 'package:shopeasy/widgets/category_sidebar.dart';
import 'package:shopeasy/widgets/product_grid.dart';
import 'package:shopeasy/widgets/top_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Row(
              children: [
                // New category sidebar on the left
                CategorySideBar(),
                // Product grid in the center
                Expanded(
                  flex: 6, // Adjusted flex factor
                  child: ProductGrid(),
                ),
                // Cart view on the right
                Expanded(
                  flex: 4, // Adjusted flex factor
                  child: CartView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
