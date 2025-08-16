import 'package:flutter/material.dart';
import 'package:shopeasy/screens/management_screen.dart';

class LeftNavigationPanel extends StatelessWidget {
  const LeftNavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: Colors.grey[100],
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildNavIcon(
                    context,
                    Icons.person_outline,
                    'GM',
                    isSelected: true,
                  ),
                  const SizedBox(height: 20),
                  _buildNavIcon(context, Icons.book_outlined, 'Daybook'),
                  _buildNavIcon(context, Icons.attach_money, 'Cash In'),
                  _buildNavIcon(context, Icons.money_off, 'Cash Out'),
                  // This icon now navigates to the ManagementScreen
                  _buildNavIcon(
                    context,
                    Icons.add_circle_outline,
                    'Product',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManagementScreen(),
                        ),
                      );
                    },
                  ),
                  _buildNavIcon(context, Icons.people_outline, 'Customer'),
                  _buildNavIcon(context, Icons.point_of_sale_outlined, 'POS'),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          _buildNavIcon(context, Icons.settings_outlined, 'Settings'),
          _buildNavIcon(context, Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildNavIcon(
    BuildContext context,
    IconData icon,
    String label, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey[600]),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.blue : Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
