import 'package:flutter/material.dart';
import 'package:shopeasy/screens/add_product_screen.dart';
import 'package:shopeasy/screens/add_variant_screen.dart';

class ProductsTabView extends StatelessWidget {
  const ProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Placeholder for Dropdowns
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('All Categories V')),
              const SizedBox(width: 16),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('Sort by: Name V')),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const AddVariantScreen()));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Variant'),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProductScreen()));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade100),
              columns: const [
                DataColumn(label: Text('Image')),
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('SKU Code')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Opening Stock')),
                DataColumn(label: Text('Stock Date')),
                DataColumn(label: Text('Variants')),
                DataColumn(label: Text('Actions')),
              ],
              rows: List.generate(3, (index) {
                return DataRow(cells: [
                  DataCell(Image.network('https://placehold.co/40x40', width: 40, height: 40)),
                  const DataCell(Text('Premium Basmati Rice')),
                  const DataCell(Text('RICE001')),
                  const DataCell(Text('₹120/kg')),
                  const DataCell(Text('500 kg')),
                  const DataCell(Text('Jan 15, 2024')),
                  const DataCell(Text('5')),
                  DataCell(Row(children: [
                    IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                  ])),
                ]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
