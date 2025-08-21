import 'package:flutter/material.dart';
import 'package:shopeasy/screens/add_variant_screen.dart';
import 'package:shopeasy/core/constants/app_colors.dart';

// Data model for the variant information
class VariantData {
  final String image;
  final String size;
  final String hsnCode;
  final String units;
  final String taxRate;
  final String dateAdded;

  VariantData({
    required this.image,
    required this.size,
    required this.hsnCode,
    required this.units,
    required this.taxRate,
    required this.dateAdded,
  });
}

class ProductVariantsScreen extends StatefulWidget {
  const ProductVariantsScreen({super.key});

  @override
  State<ProductVariantsScreen> createState() => _ProductVariantsScreenState();
}

class _ProductVariantsScreenState extends State<ProductVariantsScreen> {
  // Sample variant data
  final List<VariantData> _variants = [
    VariantData(
      image: '🌾',
      size: '5 kg',
      hsnCode: '11042000',
      units: '50 units',
      taxRate: '5%',
      dateAdded: '12/08/2025',
    ),
    VariantData(
      image: '📦',
      size: '10 kg',
      hsnCode: '11042000',
      units: '25 units',
      taxRate: '5%',
      dateAdded: '12/08/2025',
    ),
    VariantData(
      image: '📦',
      size: '25 kg',
      hsnCode: '11042000',
      units: '15 units',
      taxRate: '12%',
      dateAdded: '12/08/2025',
    ),
    VariantData(
      image: '📦',
      size: '1 kg',
      hsnCode: '11042000',
      units: '100 units',
      taxRate: '5%',
      dateAdded: '12/08/2025',
    ),
    VariantData(
      image: '📦',
      size: '2 kg',
      hsnCode: '11042000',
      units: '75 units',
      taxRate: '5%',
      dateAdded: '12/08/2025',
    ),
  ];

  final Set<int> _selectedRows = <int>{};

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
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
          'Product Variants',
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
                  'Products',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 12 : 14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 4.0 : 8.0,
                  ),
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                ),
                Text(
                  'Premium Basmati Rice',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 12 : 14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 4.0 : 8.0,
                  ),
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                ),
                Text(
                  'Variants',
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
                // Title and Product Info
                Row(
                  children: [
                    Text(
                      'Product Variants',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                // Action Buttons
                if (!isMobile)
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, size: 16),
                        label: const Text('Back to Product'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          side: BorderSide(color: AppColors.borderPrimary),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddVariantScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add Variant'),
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
                    OutlinedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, size: 14),
                      label: const Text(
                        'Back to Product',
                        style: TextStyle(fontSize: 12),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: BorderSide(color: AppColors.borderPrimary),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddVariantScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 14),
                      label: const Text(
                        'Add Variant',
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

            // Product Info
            Row(
              children: [
                Text(
                  'Premium Basmati Rice',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: isMobile ? 8 : 12),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 12,
                    vertical: isMobile ? 4 : 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '5 variants',
                    style: TextStyle(
                      color: AppColors.info,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
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
                                      hintText: 'Search variants...',
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
                                      value: 'All Sizes',
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
                                          value: 'All Sizes',
                                          child: Text('All Sizes'),
                                        ),
                                        DropdownMenuItem(
                                          value: '1 kg',
                                          child: Text('1 kg'),
                                        ),
                                        DropdownMenuItem(
                                          value: '2 kg',
                                          child: Text('2 kg'),
                                        ),
                                        DropdownMenuItem(
                                          value: '5 kg',
                                          child: Text('5 kg'),
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
                                      value: 'Sort by',
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
                                          value: 'Sort by',
                                          child: Text('Sort by'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Size',
                                          child: Text('Size'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Units',
                                          child: Text('Units'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Date',
                                          child: Text('Date'),
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
                                          Icons.view_list,
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
                                          Icons.grid_view,
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
                                        hintText: 'Search variants...',
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

                                // Size Filter
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
                                      value: 'All Sizes',
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
                                          value: 'All Sizes',
                                          child: Text('All Sizes'),
                                        ),
                                        DropdownMenuItem(
                                          value: '1 kg',
                                          child: Text('1 kg'),
                                        ),
                                        DropdownMenuItem(
                                          value: '2 kg',
                                          child: Text('2 kg'),
                                        ),
                                        DropdownMenuItem(
                                          value: '5 kg',
                                          child: Text('5 kg'),
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
                                      value: 'Sort by',
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
                                          value: 'Sort by',
                                          child: Text('Sort by'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Size',
                                          child: Text('Size'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Units',
                                          child: Text('Units'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Date',
                                          child: Text('Date'),
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
                                          Icons.view_list,
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
                                          Icons.grid_view,
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

                    // Data Table
                    Expanded(
                      child: isMobile
                          ? _buildMobileVariantList(isMobile)
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
                                              _variants.length,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value == true) {
                                                _selectedRows.addAll(
                                                  List<int>.generate(
                                                    _variants.length,
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
                                        'Size',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'HSN Code',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Units',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Tax Rate',
                                        flex: 2,
                                        centered: true,
                                        isMobile: isMobile,
                                      ),
                                      _buildTableHeader(
                                        'Date Added',
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
                                    itemCount: _variants.length,
                                    itemBuilder: (context, index) {
                                      final variant = _variants[index];
                                      return _buildTableRow(
                                        variant,
                                        index,
                                        isMobile,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Footer with Totals
                    Container(
                      padding: EdgeInsets.all(
                        isMobile ? 12 : 24,
                      ), // Reduced padding to prevent overflow
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
                                  'Showing 1-5 of 5 variants',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ), // Add space between stacked elements
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    Text(
                                      'Total Variants: 5',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Total Stock: 265 units',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
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
                                  'Showing 1-5 of 5 variants',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                                Wrap(
                                  spacing: 16,
                                  runSpacing: 4,
                                  children: [
                                    Text(
                                      'Total Variants: 5',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '|',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Total Stock: 265 units',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
            if (_selectedRows.isNotEmpty) ...[
              SizedBox(height: isMobile ? 8 : 16),
              Container(
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
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() => _selectedRows.clear());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: AppColors.onPrimary,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 8 : 12,
                          vertical: isMobile ? 4 : 8,
                        ),
                      ),
                      icon: Icon(Icons.delete, size: isMobile ? 14 : 16),
                      label: Text(
                        'Delete Selected',
                        style: TextStyle(fontSize: isMobile ? 12 : 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

  Widget _buildTableRow(VariantData variant, int index, bool isMobile) {
    final bool isSelected = _selectedRows.contains(index);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 12 : 16,
      ),
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
                width: isMobile ? 40 : 50,
                height: isMobile ? 40 : 50,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    variant.image,
                    style: TextStyle(fontSize: isMobile ? 20 : 24),
                  ),
                ),
              ),
            ),
          ),

          // Size
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                variant.size,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // HSN Code
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                variant.hsnCode,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ),

          // Units
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                variant.units,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Tax Rate
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: variant.taxRate == '5%'
                      ? AppColors.secondary.withOpacity(0.1)
                      : AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  variant.taxRate,
                  style: TextStyle(
                    color: variant.taxRate == '5%'
                        ? AppColors.secondary
                        : AppColors.warning,
                    fontSize: isMobile ? 10 : 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          // Date Added
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                variant.dateAdded,
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
                  SizedBox(width: isMobile ? 4 : 12),
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

  Widget _buildMobileVariantList(bool isMobile) {
    return ListView.builder(
      itemCount: _variants.length,
      itemBuilder: (context, index) {
        final variant = _variants[index];
        final bool isSelected = _selectedRows.contains(index);
        return Card(
          color: AppColors.surface, // Changed from default to ensure white background
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
                        color: AppColors.surface, // Changed from Colors.brown[100] to white
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          variant.image,
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
                            variant.size,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            variant.hsnCode,
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
                    _buildInfoChip(label: variant.units, isMobile: true, backgroundColor: AppColors.background, textColor: AppColors.textPrimary),
                    _buildInfoChip(
                      label: variant.taxRate,
                      textColor: variant.taxRate == '5%'
                          ? AppColors.secondary
                          : AppColors.warning,
                      backgroundColor: variant.taxRate == '5%'
                          ? AppColors.secondary.withOpacity(0.1)
                          : AppColors.warning.withOpacity(0.1),
                      isMobile: true,
                    ),
                    _buildInfoChip(label: variant.dateAdded, isMobile: true, backgroundColor: AppColors.background, textColor: AppColors.textPrimary),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildActionButton(
                      'Edit',
                      AppColors.info,
                      outlined: true,
                      isMobile: isMobile,
                    ),
                    const SizedBox(width: 8),
                    _buildActionButton(
                      'Delete',
                      AppColors.error,
                      outlined: false,
                      isMobile: isMobile,
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
    Color? backgroundColor,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 12,
        vertical: isMobile ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.borderPrimary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? AppColors.textSecondary,
          fontSize: isMobile ? 10 : 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    Color color, {
    required bool outlined,
    required bool isMobile,
  }) {
    return outlined
        ? OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: color,
              side: BorderSide(color: color),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 12,
                vertical: isMobile ? 4 : 8,
              ),
              textStyle: TextStyle(fontSize: isMobile ? 10 : 12),
            ),
            child: Text(text),
          )
        : ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: AppColors.onPrimary,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 12,
                vertical: isMobile ? 4 : 8,
              ),
              textStyle: TextStyle(fontSize: isMobile ? 10 : 12),
              elevation: 0,
            ),
            child: Text(text),
          );
  }
}
