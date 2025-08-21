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
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        toolbarHeight: isMobile ? 56 : 60,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(
            left: isMobile ? AppSizes.sm : AppSizes.md,
            top: isMobile ? AppSizes.sm : AppSizes.md,
            bottom: isMobile ? AppSizes.sm : AppSizes.md,
          ),
          child: Row(
            children: [
              Text(
                'Dashboard',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: isMobile ? AppSizes.iconXs : AppSizes.iconXs,
                color: AppColors.textTertiary,
              ),
              SizedBox(width: isMobile ? AppSizes.xs : AppSizes.xs),
              Text(
                'Products',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 4.0 : 8.0),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: isMobile ? 16 : 20),
              label: Text(
                'Back to Product',
                style: TextStyle(fontSize: isMobile ? 12 : 14),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                side: BorderSide(color: Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppSizes.sm : AppSizes.md,
                  vertical: isMobile ? AppSizes.xs : AppSizes.sm,
                ),
              ),
            ),
          ),
          SizedBox(width: isMobile ? AppSizes.sm : AppSizes.md),
          Padding(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 4.0 : 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add, size: isMobile ? 16 : 20),
              label: Text(
                'Add Product',
                style: TextStyle(fontSize: isMobile ? 12 : 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppSizes.sm : AppSizes.md,
                  vertical: isMobile ? AppSizes.xs : AppSizes.sm,
                ),
              ),
            ),
          ),
          SizedBox(width: isMobile ? AppSizes.sm : AppSizes.md),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? AppSizes.sm : AppSizes.md,
          horizontal: isMobile ? AppSizes.sm : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Products',
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontSize: isMobile ? 20 : 24,
                  ),
                ),
                SizedBox(width: isMobile ? AppSizes.xs : AppSizes.sm),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSizes.xs : AppSizes.sm,
                    vertical: isMobile ? AppSizes.xs : AppSizes.xs,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF007BFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '12 products',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 10 : 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? AppSizes.xs : AppSizes.xs),
            Text(
              'Manage your product inventory',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
            SizedBox(height: isMobile ? AppSizes.sm : AppSizes.md),
            isMobile
                ? Wrap(
                    spacing: AppSizes.sm,
                    runSpacing: AppSizes.sm,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusSm),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusSm),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isMobile ? AppSizes.sm : AppSizes.md,
                              horizontal: AppSizes.md,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? AppSizes.sm : AppSizes.md),
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
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: isMobile ? 12 : 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? AppSizes.sm : AppSizes.md),
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
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: isMobile ? 12 : 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.grid_view),
                              color: Colors.grey,
                              padding: EdgeInsets.all(isMobile ? 4 : 8),
                            ),
                            Container(
                              width: 1,
                              height: isMobile ? 20 : 24,
                              color: Colors.grey.shade300,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                              color: const Color(0xFF007BFF),
                              padding: EdgeInsets.all(isMobile ? 4 : 8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusSm),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusSm),
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
                      SizedBox(width: AppSizes.md),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSizes.md),
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
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.md),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSizes.md),
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
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.md),
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
            SizedBox(height: isMobile ? AppSizes.sm : AppSizes.md),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              ),
              child: isMobile
                  ? _buildMobileProductList()
                  : Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            horizontalMargin: 12,
                            columnSpacing: 24,
                            headingRowColor:
                                MaterialStateProperty.all(Colors.grey.shade50),
                            showCheckboxColumn: true,
                            onSelectAll: (value) {
                              setState(() {
                                if (value == true) {
                                  _selectedRows
                                    ..clear()
                                    ..addAll(
                                        List<int>.generate(_rowCount, (i) => i));
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
                                        ? SizedBox(
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
                                                    const Icon(Icons.image,
                                                        size: 40),
                                          ),
                                  ),
                                  DataCell(
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          index == 0
                                              ? 'Premium Basmati Rice'
                                              : index == 1
                                                  ? 'Sona Masoori Rice'
                                                  : 'Idli Rice Premium',
                                          style:
                                              AppTextStyles.bodyMedium.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          index == 0
                                              ? 'Long grain aromatic rice'
                                              : index == 1
                                                  ? 'Premium quality white rice'
                                                  : 'Fine grained rice for idli',
                                          style:
                                              AppTextStyles.bodySmall.copyWith(
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
                                        style:
                                            AppTextStyles.bodySmall.copyWith(
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
                                      style:
                                          AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                      Text('${[500, 750, 300][index]} kg')),
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
                                        SizedBox(width: AppSizes.xs),
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
                                            backgroundColor:
                                                Colors.green.withOpacity(0.1),
                                            side: BorderSide.none,
                                            shape: const StadiumBorder(),
                                          ),
                                        ),
                                        SizedBox(width: AppSizes.xs),
                                        OutlinedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete, size: 16),
                                          label: const Text('Delete'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.red,
                                            backgroundColor:
                                                Colors.red.withOpacity(0.1),
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
              SizedBox(height: isMobile ? AppSizes.sm : AppSizes.md),
              Container(
                padding: EdgeInsets.all(isMobile ? AppSizes.sm : AppSizes.md),
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
                        fontSize: isMobile ? 12 : 14,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? AppSizes.sm : AppSizes.md,
                          vertical: isMobile ? AppSizes.xs : AppSizes.sm,
                        ),
                      ),
                      icon: Icon(Icons.delete, size: isMobile ? 16 : 20),
                      label: Text(
                        'Delete Selected',
                        style: TextStyle(fontSize: isMobile ? 12 : 14),
                      ),
                    ),
                    SizedBox(width: isMobile ? AppSizes.sm : AppSizes.md),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.file_upload, size: isMobile ? 16 : 20),
                      label: Text(
                        'Export Selected',
                        style: TextStyle(fontSize: isMobile ? 12 : 14),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue.shade700,
                        side: BorderSide(color: Colors.blue.shade300),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? AppSizes.sm : AppSizes.md,
                          vertical: isMobile ? AppSizes.xs : AppSizes.sm,
                        ),
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

  Widget _buildMobileProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _rowCount,
      itemBuilder: (context, index) {
        final bool isSelected = _selectedRows.contains(index);
        return Card(
          margin: const EdgeInsets.symmetric(vertical: AppSizes.xs, horizontal: AppSizes.sm),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.sm),
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
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image, size: 40),
                          ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Column(
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
                              fontSize: 14,
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
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.xs),
                Wrap(
                  spacing: AppSizes.sm,
                  runSpacing: AppSizes.xs,
                  children: [
                    _buildInfoChip(
                      label: index == 0
                          ? 'RICE001'
                          : index == 1
                              ? 'RICE002'
                              : 'RICE003',
                      color: Colors.grey[200]!,
                    ),
                    _buildInfoChip(
                      label: index == 0
                          ? '₹120/kg'
                          : index == 1
                              ? '₹85/kg'
                              : '₹95/kg',
                      textColor: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                    _buildInfoChip(label: '${[500, 750, 300][index]} kg'),
                    _buildInfoChip(label: '12/08/2025'),
                  ],
                ),
                const SizedBox(height: AppSizes.sm),
                Wrap(
                  spacing: AppSizes.xs,
                  runSpacing: AppSizes.xs,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 14),
                      label: const Text('Edit', style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddVariantScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 14),
                      label: const Text('Variants', style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green.withOpacity(0.1),
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, size: 14),
                      label: const Text('Delete', style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red.withOpacity(0.1),
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                      ),
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
    Color? color,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor ?? AppColors.textPrimary,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }
}