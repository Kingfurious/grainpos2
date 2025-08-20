import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/numeric_text_field.dart';
import 'package:intl/intl.dart';
import '../core/constants/app_colors.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _skuCodeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _openingStockController = TextEditingController();
  final TextEditingController _stockDateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _stockDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement save product logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Saving Product...')));
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _skuCodeController.dispose();
    _priceController.dispose();
    _openingStockController.dispose();
    _stockDateController.dispose();
    super.dispose();
  }

  bool get isMobile => MediaQuery.of(context).size.width < 768;
  bool get isTablet => MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 1024;
  bool get isDesktop => MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 768;
    final isMediumScreen = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(context, isSmallScreen),
      body: _buildBody(context, isSmallScreen, isMediumScreen),
      bottomNavigationBar: _buildBottomBar(context, isSmallScreen),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isSmallScreen) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: isSmallScreen ? 60 : 80,
      titleSpacing: 0,
      leading: isSmallScreen
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      )
          : null,
      automaticallyImplyLeading: isSmallScreen,
      title: Padding(
        padding: EdgeInsets.only(left: isSmallScreen ? 0 : AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Breadcrumbs - hidden on mobile
            if (!isSmallScreen)
              _buildBreadcrumbs(),
            if (!isSmallScreen) const SizedBox(height: 4),

            // Header Title
            Text(
              'Add New Product',
              style: AppTextStyles.headlineMedium.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isSmallScreen ? 18 : 24,
              ),
            ),
            if (!isSmallScreen)
              Text(
                'Fill in the details to add a new product',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
          ],
        ),
      ),
      actions: [
        if (!isSmallScreen)
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.md),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Back to Products'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBreadcrumbs() {
    return Row(
      children: [
        Text(
          'Dashboard',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 16,
          color: Colors.grey[600],
        ),
        Text(
          'Products & Variants',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 16,
          color: Colors.grey[600],
        ),
        Text(
          'Add New Product',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, bool isSmallScreen, bool isMediumScreen) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? AppSizes.md : AppSizes.lg),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isSmallScreen ? double.infinity : (isMediumScreen ? 700 : 800),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(isSmallScreen ? 8 : 12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(isSmallScreen ? AppSizes.md : AppSizes.xl),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mobile breadcrumbs
                      if (isSmallScreen) ...[
                        _buildMobileBreadcrumbs(),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Product Image Upload Section
                      _buildImageUploadSection(isSmallScreen),
                      SizedBox(height: isSmallScreen ? AppSizes.lg : AppSizes.xl),

                      // Form Fields
                      _buildFormFields(isSmallScreen),
                      SizedBox(height: isSmallScreen ? AppSizes.lg : AppSizes.xl),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileBreadcrumbs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            'Dashboard',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 14,
            color: Colors.grey[600],
          ),
          Text(
            'Products & Variants',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 14,
            color: Colors.grey[600],
          ),
          Text(
            'Add New Product',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'Product Image',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isSmallScreen ? 16 : 18,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Optional',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: isSmallScreen ? 10 : 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          'Upload a clear product image to help customers identify the item',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
            fontSize: isSmallScreen ? 12 : 14,
          ),
        ),
        const SizedBox(height: AppSizes.md),

        // Upload section - responsive layout
        if (isSmallScreen)
          _buildMobileImageUpload()
        else
          _buildDesktopImageUpload(),
      ],
    );
  }

  Widget _buildMobileImageUpload() {
    return Column(
      children: [
        // Upload area
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.blue,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                'Upload Product Image',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'JPG, PNG up to 5MB',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[500],
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.md),

        // Info section
        _buildImageInfo(true),
      ],
    );
  }

  Widget _buildDesktopImageUpload() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload area
        Container(
          width: 200,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.blue,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                'Upload Product Image',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'JPG, PNG up to 5MB',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSizes.lg),

        // Info section
        Expanded(child: _buildImageInfo(false)),
      ],
    );
  }

  Widget _buildImageInfo(bool isMobile) {
    final infoItems = [
      'Recommended size: 800×600px',
      'Formats: JPG, PNG',
      'Maximum size: 5MB',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infoItems.map((info) => Padding(
        padding: EdgeInsets.only(bottom: isMobile ? AppSizes.xs : AppSizes.sm),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.info_outline,
                size: isMobile ? 14 : 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: isMobile ? AppSizes.xs : AppSizes.sm),
            Expanded(
              child: Text(
                info,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildFormFields(bool isSmallScreen) {
    if (isSmallScreen) {
      // Stack fields vertically on mobile
      return Column(
        children: [
          _buildProductNameField(),
          const SizedBox(height: AppSizes.md),
          _buildSKUCodeField(),
          const SizedBox(height: AppSizes.md),
          _buildPriceField(),
          const SizedBox(height: AppSizes.md),
          _buildOpeningStockField(),
          const SizedBox(height: AppSizes.md),
          _buildStockDateField(),
        ],
      );
    } else {
      // Two columns on larger screens
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildProductNameField()),
              const SizedBox(width: AppSizes.lg),
              Expanded(child: _buildSKUCodeField()),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          Row(
            children: [
              Expanded(child: _buildPriceField()),
              const SizedBox(width: AppSizes.lg),
              Expanded(child: _buildOpeningStockField()),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          Row(
            children: [
              Expanded(child: _buildStockDateField()),
              const Expanded(child: SizedBox()), // Empty space for alignment
            ],
          ),
        ],
      );
    }
  }

  Widget _buildProductNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Product Name ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: _productNameController,
          decoration: InputDecoration(
            hintText: 'Enter product name (e.g., Premium Basmati Rice)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Product Name is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSKUCodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'SKU Code ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: _skuCodeController,
          decoration: InputDecoration(
            hintText: 'Enter SKU (e.g., RICE001)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'SKU Code is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Price (₹) ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: _priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Price is required';
            }
            if (double.tryParse(value) == null) {
              return 'Invalid price';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildOpeningStockField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Opening Stock ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: _openingStockController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter quantity',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Opening Stock is required';
            }
            if (int.tryParse(value) == null) {
              return 'Invalid stock quantity';
            }
            return null;
          },
        ),
        const SizedBox(height: 4),
        Text(
          'Initial quantity of products in stock',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildStockDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Stock Date ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: _stockDateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            suffixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Stock Date is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 4),
        Text(
          'Date when the stock was added',
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? AppSizes.md : AppSizes.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: isSmallScreen
          ? Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: _saveProduct,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Save Product'),
          ),
          const SizedBox(height: AppSizes.sm),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey[300]!),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Cancel'),
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey[300]!),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: AppSizes.md),
          ElevatedButton(
            onPressed: _saveProduct,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Save Product'),
          ),
        ],
      ),
    );
  }
}