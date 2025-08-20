import 'package:flutter/material.dart';
import 'package:shopeasy/screens/add_product_screen.dart';
import 'package:shopeasy/screens/add_variant_screen.dart';
import 'package:shopeasy/core/constants/app_sizes.dart';
import 'package:shopeasy/core/constants/app_text_styles.dart';
import 'package:shopeasy/core/constants/app_colors.dart';

class ProductsTabView extends StatefulWidget {
  const ProductsTabView({super.key});

  @override
  State<ProductsTabView> createState() => _ProductsTabViewState();
}

class _ProductsTabViewState extends State<ProductsTabView> {
  final int _rowCount = 3;
  final Set<int> _selectedRows = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        toolbarHeight: 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.md,
            top: AppSizes.md,
            bottom: AppSizes.md,
          ),
          child: Row(
            children: [
              Text(
                'Dashboard',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: AppSizes.iconXs,
                color: AppColors.textTertiary,
              ),
              const SizedBox(width: AppSizes.xs),
              Text(
                'Products',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Product'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                side: BorderSide(color: Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Add Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.md),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
        ), // Only vertical padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Products', style: AppTextStyles.headlineMedium),
                const SizedBox(width: AppSizes.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: AppSizes.xs,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF007BFF),
                    borderRadius: BorderRadius.circular(20), // Pill shape
                  ),
                  child: Text(
                    '12 products',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              'Manage your product inventory',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppSizes.md,
                        horizontal: AppSizes.md,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'All Categories',
                      icon: const Icon(Icons.arrow_drop_down),
                      items: <String>['All Categories', 'Category 1']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'Sort by Name',
                      icon: const Icon(Icons.arrow_drop_down),
                      items: <String>['Sort by Name', 'Price', 'Stock']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grid_view),
                        color: Colors.grey,
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.grey.shade300,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: const Color(0xFF007BFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      horizontalMargin: 12,
                      columnSpacing: 24,
                      headingRowColor: MaterialStateProperty.all(
                        Colors.grey.shade50,
                      ),
                      showCheckboxColumn: true,
                      onSelectAll: (value) {
                        setState(() {
                          if (value == true) {
                            _selectedRows
                              ..clear()
                              ..addAll(List<int>.generate(_rowCount, (i) => i));
                          } else {
                            _selectedRows.clear();
                          }
                        });
                      },
                      columns: const [
                        DataColumn(label: Text('Image')),
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('SKU Code')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Opening Stock')),
                        DataColumn(label: Text('Stock Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(_rowCount, (index) {
                        final bool isSelected = _selectedRows.contains(index);
                        return DataRow(
                          selected: isSelected,
                          onSelectChanged: (value) {
                            setState(() {
                              if (value == true) {
                                _selectedRows.add(index);
                              } else {
                                _selectedRows.remove(index);
                              }
                            });
                          },
                          cells: [
                            DataCell(
                              index == 1
                                  ? const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                    )
                                  : Image.asset(
                                      index == 0
                                          ? 'assets/images/premium_basmati.jpg'
                                          : 'assets/images/idli_rice.jpg',
                                      width: 40,
                                      height: 40,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.image, size: 40),
                                    ),
                            ),
                            DataCell(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    index == 0
                                        ? 'Premium Basmati Rice'
                                        : index == 1
                                        ? 'Sona Masoori Rice'
                                        : 'Idli Rice Premium',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    index == 0
                                        ? 'Long grain aromatic rice'
                                        : index == 1
                                        ? 'Premium quality white rice'
                                        : 'Fine grained rice for idli',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.sm,
                                  vertical: AppSizes.xs,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusSm,
                                  ),
                                ),
                                child: Text(
                                  index == 0
                                      ? 'RICE001'
                                      : index == 1
                                      ? 'RICE002'
                                      : 'RICE003',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                index == 0
                                    ? '₹120/kg'
                                    : index == 1
                                    ? '₹85/kg'
                                    : '₹95/kg',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DataCell(Text('${[500, 750, 300][index]} kg')),
                            const DataCell(Text('12/08/2025')),
                            DataCell(
                              Row(
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit, size: 16),
                                    label: const Text('Edit'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AddVariantScreen(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.add, size: 16),
                                    label: const Text('Variants'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.green,
                                      backgroundColor: Colors.green.withOpacity(
                                        0.1,
                                      ),
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete, size: 16),
                                    label: const Text('Delete'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.red,
                                      backgroundColor: Colors.red.withOpacity(
                                        0.1,
                                      ),
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Showing 1-12 of 12 products',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Stock Value: ',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              '₹2,45,000',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
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
            if (_selectedRows.isNotEmpty) ...[
              const SizedBox(height: AppSizes.md),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    Text(
                      '${_selectedRows.length} items selected',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() => _selectedRows.clear());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete Selected'),
                    ),
                    const SizedBox(width: AppSizes.md),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.file_upload),
                      label: const Text('Export Selected'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue.shade700,
                        side: BorderSide(color: Colors.blue.shade300),
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
}
