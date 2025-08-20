import 'package:flutter/material.dart';
import 'package:shopeasy/screens/add_variant_screen.dart';
import 'package:shopeasy/core/constants/app_sizes.dart';
import 'package:shopeasy/core/constants/app_text_styles.dart';
import 'package:shopeasy/core/constants/app_colors.dart';

class VariantsTabView extends StatefulWidget {
  const VariantsTabView({super.key});

  @override
  State<VariantsTabView> createState() => _VariantsTabViewState();
}

class _VariantsTabViewState extends State<VariantsTabView> {
  final int _rowCount = 5;
  final Set<int> _selectedRows = <int>{};
  final List<int> _unitsList = <int>[50, 25, 15, 100, 75];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60, // Adjusted height for a more compact app bar
        titleSpacing: 0, // Removed default title spacing
        title: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.md,
            top: AppSizes.md,
            bottom: AppSizes.md,
          ),
          child: Row(
            children: [
              Text(
                'Products',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: AppSizes.iconXs,
                color: AppColors.textTertiary,
              ),
              Text(
                'Premium Basmati Rice',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: AppSizes.iconXs,
                color: AppColors.textTertiary,
              ),
              Text(
                'Variants',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back to Product'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              side: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddVariantScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Variant'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Use blue for primary action
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: AppSizes.md),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header for Product Variants
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product Variants', style: AppTextStyles.headlineMedium),
                Row(
                  children: [
                    Text(
                      'Premium Basmati Rice',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      ),
                      child: Text(
                        '5 variants',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            // Search and Filter Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search variants...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppSizes.md,
                        horizontal: AppSizes.md,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.md,
                    vertical: AppSizes.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'All Sizes',
                      icon: const Icon(Icons.arrow_drop_down),
                      items: <String>['All Sizes', '1kg', '2kg', '5kg']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {
                        // TODO: Implement filter by size
                      },
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.md,
                    vertical: AppSizes.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'Sort by',
                      icon: const Icon(Icons.arrow_drop_down),
                      items: <String>['Sort by', 'Name', 'Price', 'Stock']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newValue) {
                        // TODO: Implement sort by
                      },
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
                        onPressed: () {
                          // TODO: Implement list view
                        },
                        icon: const Icon(Icons.list),
                        color: Colors.blue, // Selected color
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Implement grid view
                        },
                        icon: const Icon(Icons.grid_view),
                        color: Colors.grey, // Unselected color
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            // DataTable
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: AppSizes.md, // Adjusted column spacing
                  headingRowColor: MaterialStateProperty.all(
                    Colors.grey.shade100,
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
                    DataColumn(label: Text('Size')),
                    DataColumn(label: Text('HSN Code')),
                    DataColumn(label: Text('Units')),
                    DataColumn(label: Text('Tax Rate')),
                    DataColumn(label: Text('Date Added')),
                    DataColumn(
                      label: Text('Actions'),
                      columnWidth: FixedColumnWidth(150.0),
                    ),
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
                        const DataCell(
                          Image(
                            image: NetworkImage('https://placehold.co/40x40'),
                            width: 40,
                            height: 40,
                          ),
                        ),
                        DataCell(Text('${[5, 10, 25, 1, 2][index]} kg')),
                        const DataCell(Text('11042000')),
                        DataCell(Text('${_unitsList[index]} units')),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.sm,
                              vertical: AppSizes.xs,
                            ),
                            decoration: BoxDecoration(
                              color: index == 2
                                  ? Colors.orangeAccent.withOpacity(0.15)
                                  : Colors.greenAccent.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusSm,
                              ),
                            ),
                            child: Text(
                              index == 2 ? '12%' : '5%',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: index == 2
                                    ? Colors.orange
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ),
                        const DataCell(Text('12/08/2025')),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.edit, size: 18),
                                label: const Text('Edit'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                icon: const Icon(Icons.delete, size: 18),
                                label: const Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.md),
            // Footer showing total variants and stock
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Showing 1-5 of 5 variants',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(), // Pushes the next elements to the right
                Text(
                  'Total Variants: ',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '$_rowCount',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  '|',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Total Stock: ',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${_unitsList.reduce((a, b) => a + b)} units',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            // Selected items action bar (conditionally displayed)
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
                    const SizedBox(width: AppSizes.md),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.percent),
                      label: const Text('Update Tax Rates'),
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
