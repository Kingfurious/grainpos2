import 'package:flutter/material.dart';
import 'package:shopeasy/screens/add_variant_screen.dart';

// Custom color class for the UI
class AppColors {
  static const Color primaryColor = Color(0xFF0D63F3);
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color textColor = Color(0xFF202124);
  static const Color secondaryTextColor = Color(0xFF5F6368);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color greenColor = Color(0xFF34A853);
  static const Color redColor = Color(0xFFEA4335);
  static const Color orangeColor = Color(0xFFFF9800);
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Product Variants',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            Row(
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  'Premium Basmati Rice',
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  'Variants',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title and Product Info
                Row(
                  children: [
                    const Text(
                      'Product Variants',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                // Action Buttons
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, size: 16),
                      label: const Text('Back to Product'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textColor,
                        side: BorderSide(color: AppColors.borderColor),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddVariantScreen()),
                        );
                      },
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Add Variant'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Product Info
            Row(
              children: [
                Text(
                  'Premium Basmati Rice',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '5 variants',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Content Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor),
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
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          // Search Bar
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.borderColor),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search variants...',
                                  hintStyle: TextStyle(color: AppColors.secondaryTextColor),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Size Filter
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: 'All Sizes',
                                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryTextColor),
                                style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
                                items: const [
                                  DropdownMenuItem(value: 'All Sizes', child: Text('All Sizes')),
                                  DropdownMenuItem(value: '1 kg', child: Text('1 kg')),
                                  DropdownMenuItem(value: '2 kg', child: Text('2 kg')),
                                  DropdownMenuItem(value: '5 kg', child: Text('5 kg')),
                                ],
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Sort Filter
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: 'Sort by',
                                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryTextColor),
                                style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
                                items: const [
                                  DropdownMenuItem(value: 'Sort by', child: Text('Sort by')),
                                  DropdownMenuItem(value: 'Size', child: Text('Size')),
                                  DropdownMenuItem(value: 'Units', child: Text('Units')),
                                  DropdownMenuItem(value: 'Date', child: Text('Date')),
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
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    Icons.view_list,
                                    color: AppColors.primaryColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    Icons.grid_view,
                                    color: AppColors.secondaryTextColor,
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
                      child: Column(
                        children: [
                          // Table Header
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border(
                                top: BorderSide(color: AppColors.borderColor),
                                bottom: BorderSide(color: AppColors.borderColor),
                              ),
                            ),
                            child: Row(
                              children: [
                                // Checkbox
                                SizedBox(
                                  width: 40,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                _buildTableHeader('Image', flex: 1, centered: true),
                                _buildTableHeader('Size', flex: 2, centered: true),
                                _buildTableHeader('HSN Code', flex: 2, centered: true),
                                _buildTableHeader('Units', flex: 2, centered: true),
                                _buildTableHeader('Tax Rate', flex: 2, centered: true),
                                _buildTableHeader('Date Added', flex: 2, centered: true),
                                _buildTableHeader('Actions', flex: 3, centered: true),
                              ],
                            ),
                          ),

                          // Table Rows
                          Expanded(
                            child: ListView.builder(
                              itemCount: _variants.length,
                              itemBuilder: (context, index) {
                                final variant = _variants[index];
                                return _buildTableRow(variant, index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Footer with Totals
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppColors.borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Showing 1-5 of 5 variants',
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Variants: 5',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Total Stock: 265 units',
                                style: TextStyle(
                                  color: AppColors.textColor,
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
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text, {int flex = 1, bool centered = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: centered ? TextAlign.center : TextAlign.left,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTableRow(VariantData variant, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: 40,
            child: Checkbox(
              value: false,
              onChanged: (value) {},
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
                  color: Colors.brown[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    variant.image,
                    style: const TextStyle(fontSize: 24),
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
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
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
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
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
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
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
                      ? AppColors.greenColor.withOpacity(0.1)
                      : AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  variant.taxRate,
                  style: TextStyle(
                    color: variant.taxRate == '5%'
                        ? AppColors.greenColor
                        : AppColors.orangeColor,
                    fontSize: 12,
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
                  color: AppColors.secondaryTextColor,
                  fontSize: 14,
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
                  _buildActionButton('Edit', AppColors.primaryColor, outlined: true),
                  const SizedBox(width: 12),
                  _buildActionButton('Delete', AppColors.redColor, outlined: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, {required bool outlined}) {
    return SizedBox(
      height: 36,
      width: 70,
      child: outlined
          ? OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      )
          : ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}