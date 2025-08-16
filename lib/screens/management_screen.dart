import 'package:flutter/material.dart';
import 'package:shopeasy/widgets/products_tab_view.dart';
import 'package:shopeasy/widgets/variants_tab_view.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Product Management',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Products (12)'),
              Tab(text: 'All Variants (25)'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductsTabView(),
            VariantsTabView(),
          ],
        ),
      ),
    );
  }
}
