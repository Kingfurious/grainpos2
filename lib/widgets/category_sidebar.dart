import 'package:flutter/material.dart';

class CategorySideBar extends StatefulWidget {
  const CategorySideBar({super.key});

  @override
  State<CategorySideBar> createState() => _CategorySideBarState();
}

class _CategorySideBarState extends State<CategorySideBar> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    'All Rice',
    'Basmati Rice',
    'Sona Masoori',
    'Idli Rice',
    'Parboiled Rice',
    'Raw Rice',
    'Brown Rice',
    'Broken Rice',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(
            context,
            _categories[index],
            index == _selectedIndex,
            () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          border: isSelected
              ? const Border(left: BorderSide(color: Colors.blue, width: 4))
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
