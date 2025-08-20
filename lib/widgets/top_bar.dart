import 'package:flutter/material.dart';
import 'package:shopeasy/screens/management_screen.dart';
import 'package:shopeasy/screens/billing_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    // This function handles navigation to the product management screen.
    void navigateToManagementScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ManagementScreen()),
      );
    }

    // This function handles navigation to the billing screen.
    void navigateToBillingScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BillingManagementPage()),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          const Text(
            'GrainMart POS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 40),
          const Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search items, barcode or SKU',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTopButton(context, Icons.delivery_dining, 'Delivery'),
                // The 'Bills' button now navigates to the billing screen.
                _buildTopButton(
                  context,
                  Icons.receipt_long,
                  'Bills',
                  onTap: navigateToBillingScreen,
                ),
                _buildTopButton(context, Icons.book, 'Daybook'),
                _buildTopButton(context, Icons.pause_circle_outline, 'Hold'),
                _buildTopButton(
                  context,
                  Icons.add_circle_outline,
                  'Product',
                  onTap: navigateToManagementScreen,
                ),
                _buildTopButton(context, Icons.people_outline, 'Customer'),
                _buildTopButton(
                  context,
                  Icons.inventory_2_outlined,
                  'Stock',
                  onTap: navigateToManagementScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // The button widget is now wrapped in an InkWell to make it tappable.
  Widget _buildTopButton(
    BuildContext context,
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            Icon(icon, color: Color.fromARGB(255, 26, 111, 214), size: 24),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
