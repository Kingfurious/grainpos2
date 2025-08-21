import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'add_variant_screen.dart';
import 'variant_main.dart';
import 'package:shopeasy/core/constants/app_colors.dart';

// Data model for the product information
class ProductData {
  final String image;
  final String productName;
  final String description;
  final String skuCode;
  final String price;
  final String openingStock;
  final String stockDate;

  ProductData({
    required this.image,
    required this.productName,
    required this.description,
    required this.skuCode,
    required this.price,
    required this.openingStock,
    required this.stockDate,
  });
}

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  // Sample product data
  final List<ProductData> _products = [
    ProductData(
      image: '🌾',
      productName: 'Premium Basmati Rice',
      description: 'Long grain aromatic rice',
      skuCode: 'RICE001',
      price: '₹120/kg',
      openingStock: '500 kg',
      stockDate: '12/08/2025',
    ),
    ProductData(
      image: '🌾',
      productName: 'Sona Masoori Rice',
      description: 'Premium quality white rice',
      skuCode: 'RICE002',
      price: '₹85/kg',
      openingStock: '750 kg',
      stockDate: '12/08/2025',
    ),
    ProductData(
      image: '🌾',
      productName: 'Idli Rice Premium',
      description: 'Fine grained rice for idli',
      skuCode: 'RICE003',
      price: '₹95/kg',
      openingStock: '300 kg',
      stockDate: '12/08/2025',
    ),
  ];

  final Set<int> _selectedRows = <int>{};

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: isMobile ? 20 : 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Product Management',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            Row(
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 12 : 14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 4.0 : 8.0,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: isMobile ? 14 : 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'Products',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 16 : 24),

            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title and Count
                Row(
                  children: [
                    Text(
                      'Products',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: isMobile ? 8 : 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8 : 12,
                        vertical: isMobile ? 4 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '12 products',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // Action Buttons
                if (!isMobile)
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProductVariantsScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Variants'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.onSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          elevation: 0,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddProductScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add Product'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.info,
                          foregroundColor: AppColors.onPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (isMobile)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductVariantsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 14),
                      label: const Text(
                        'Variants',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: AppColors.onSecondary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        elevation: 0,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddProductScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 14),
                      label: const Text(
                        'Add Product',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.info,
                        foregroundColor: AppColors.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: isMobile ? 8 : 8),

            // Subtitle
            Text(
              'Manage your product inventory',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
            SizedBox(height: isMobile ? 16 : 32),

            // Content Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderPrimary),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Search and Filter Section
                    Padding(
                      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                      child: isMobile
                          ? Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderPrimary,
                                    ),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search products...',
                                      hintStyle: TextStyle(
                                        color: AppColors.textSecondary,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.textSecondary,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 10,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderPrimary,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'All Categories',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.textSecondary,
                                        size: 20,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'All Categories',
                                          child: Text('All Categories'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Rice',
                                          child: Text('Rice'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Grains',
                                          child: Text('Grains'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderPrimary,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'Sort by Name',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.textSecondary,
                                        size: 20,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'Sort by Name',
                                          child: Text('Sort by Name'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Sort by Price',
                                          child: Text('Sort by Price'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Sort by Stock',
                                          child: Text('Sort by Stock'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: AppColors.surface,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.grid_view,
                                          color: AppColors.info,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.view_list,
                                          color: AppColors.textSecondary,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                // Search Bar
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.surface,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.borderPrimary,
                                      ),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search products...',
                                        hintStyle: TextStyle(
                                          color: AppColors.textSecondary,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: AppColors.textSecondary,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // Category Filter
                                Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderPrimary,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'All Categories',
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.textSecondary,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'All Categories',
                                          child: Text('All Categories'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Rice',
                                          child: Text('Rice'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Grains',
                                          child: Text('Grains'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // Sort Filter
                                Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderPrimary,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'Sort by Name',
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.textSecondary,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'Sort by Name',
                                          child: Text('Sort by Name'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Sort by Price',
                                          child: Text('Sort by Price'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Sort by Stock',
                                          child: Text('Sort by Stock'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // View Toggle
                                Container(
                                  height: 48,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.surface,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.grid_view,
                                          color: AppColors.info,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.view_list,
                                          color: AppColors.textSecondary,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Data Table or Mobile List
                    Expanded(
                      child: isMobile
                          ? _buildMobileProductList()
                          : Column(
                              children: [
                                // Table Header
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    border: Border(
                                      top: BorderSide(
                                        color: AppColors.borderPrimary,
                                      ),
                                      bottom: BorderSide(
                                        color: AppColors.borderPrimary,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      // Checkbox
                                      SizedBox(
                                        width: 40,
                                        child: Checkbox(
                                          value:
                                              _selectedRows.length ==
                                              _products.length,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value == true) {
                                                _selectedRows.addAll(
                                                  List<int>.generate(
                                                    _products.length,
                                                    (i) => i,
                                                  ),
                                                );
                                              } else {
                                                _selectedRows.clear();
                                              }
                                            });
                                          },
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ),
                                      _buildTableHeader(
                                        'Image',
                                        flex: 1,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Product Name',
                                        flex: 3,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'SKU Code',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Price',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Opening Stock',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Stock Date',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Actions',
                                        flex: 3,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                    ],
                                  ),
                                ),

                                // Table Rows
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _products.length,
                                    itemBuilder: (context, index) {
                                      final product = _products[index];
                                      return _buildTableRow(
                                        product,
                                        index,
                                        isMobile,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Footer with Stock Value
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 24),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppColors.borderPrimary),
                        ),
                      ),
                      child: isMobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Showing 1-12 of 12 products',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ), // Add space between stacked elements
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Keep this for internal alignment
                                  children: [
                                    Text(
                                      'Total Stock Value:',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '₹2,45,000',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Showing 1-12 of 12 products',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Total Stock Value:',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '₹2,45,000',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),

                    // Selected Items Actions
                    if (_selectedRows.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
                        child: Container(
                          padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.info.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${_selectedRows.length} items selected',
                                style: TextStyle(
                                  color: AppColors.info,
                                  fontSize: isMobile ? 12 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              OutlinedButton.icon(
                                onPressed: () {
                                  setState(() => _selectedRows.clear());
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: isMobile ? 14 : 16,
                                ),
                                label: Text(
                                  'Delete Selected',
                                  style: TextStyle(
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.error,
                                  side: BorderSide(color: AppColors.error),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 8 : 12,
                                    vertical: isMobile ? 4 : 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(
    String text, {
    int flex = 1,
    bool centered = false,
    required bool isMobile,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: centered ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          fontSize: isMobile ? 12 : 14,
        ),
      ),
    );
  }

  Widget _buildTableRow(ProductData product, int index, bool isMobile) {
    final bool isSelected = _selectedRows.contains(index);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderPrimary.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: 40,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedRows.add(index);
                  } else {
                    _selectedRows.remove(index);
                  }
                });
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),

          // Image
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    product.image,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),

          // Product Name & Description
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 10 : 12,
                  ),
                ),
              ],
            ),
          ),

          // SKU Code
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                product.skuCode,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ),

          // Price
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                product.price,
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Opening Stock
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                product.openingStock,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Stock Date
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                product.stockDate,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ),

          // Actions
          Expanded(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    'Edit',
                    AppColors.info,
                    outlined: true,
                    isMobile: isMobile,
                  ),
                  SizedBox(width: isMobile ? 4 : 8),
                  _buildActionButton(
                    'Variants',
                    AppColors.secondary,
                    outlined: true,
                    isMobile: isMobile,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddVariantScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: isMobile ? 4 : 8),
                  _buildActionButton(
                    'Delete',
                    AppColors.error,
                    outlined: false,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProductList() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        final bool isSelected = _selectedRows.contains(index);
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            _selectedRows.add(index);
                          } else {
                            _selectedRows.remove(index);
                          }
                        });
                      },
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          product.image,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            product.description,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip(
                      label: product.skuCode,
                      backgroundColor: AppColors.background,
                      textColor: AppColors.textPrimary,
                    ),
                    _buildInfoChip(
                      label: product.price,
                      textColor: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                      backgroundColor: AppColors.background,
                    ),
                    _buildInfoChip(
                      label: product.openingStock,
                      backgroundColor: AppColors.background,
                      textColor: AppColors.textPrimary,
                    ),
                    _buildInfoChip(
                      label: product.stockDate,
                      backgroundColor: AppColors.background,
                      textColor: AppColors.textPrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildActionButton(
                      'Edit',
                      AppColors.info,
                      outlined: true,
                      isMobile: true,
                    ),
                    _buildActionButton(
                      'Variants',
                      AppColors.secondary,
                      outlined: true,
                      isMobile: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddVariantScreen(),
                          ),
                        );
                      },
                    ),
                    _buildActionButton(
                      'Delete',
                      AppColors.error,
                      outlined: false,
                      isMobile: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoChip({
    required String label,
    Color? textColor,
    FontWeight? fontWeight,
    Color? backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.borderPrimary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? AppColors.textSecondary,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    Color color, {
    required bool outlined,
    bool isMobile = false,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: isMobile ? 28 : 32,
      width: text == 'Variants' ? (isMobile ? 70 : 80) : (isMobile ? 50 : 60),
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed ?? () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 6),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 6),
                elevation: 0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: isMobile ? 10 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
