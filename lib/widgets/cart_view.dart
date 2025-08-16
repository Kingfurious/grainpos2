import 'package:flutter/material.dart';
import 'package:shopeasy/models/cart_item.dart';
import 'package:shopeasy/widgets/cart_item_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = [
      CartItem(productName: 'Premium Basmati Rice', sku: 'SKU: RICE001', price: 998.00, quantity: 2),
      CartItem(productName: 'Sona Masoori Rice', sku: 'SKU: RICE002', price: 599.00, quantity: 1),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'Customer Name'))),
              SizedBox(width: 10),
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'Mobile Nu...'))),
              Icon(Icons.edit),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              Text('Qty', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              Text('Price', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemCard(item: cartItems[index]);
              },
            ),
          ),
          const Divider(),
          _buildPriceDetail('Subtotal', '₹1,597.00'),
          _buildPriceDetail('Discount', '-₹50.00', color: Colors.red),
          _buildPriceDetail('Tax (5%)', '₹72.35'),
          _buildPriceDetail('Round Off', '+₹0.65'),
          const Divider(thickness: 2, height: 20),
          _buildPriceDetail('Total', '₹1,520.00', isTotal: true),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Hold'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Add Discount'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Confirm Payment', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail(String label, String value, {Color color = Colors.black, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 20 : 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 20 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
