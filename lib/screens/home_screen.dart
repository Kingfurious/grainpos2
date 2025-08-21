import 'package:flutter/material.dart';
import 'package:shopeasy/core/constants/app_colors.dart';
import 'package:shopeasy/screens/billing_screen.dart';

import 'management_screen.dart';

void main() {
  runApp(const GrainMartPOSApp());
}

class GrainMartPOSApp extends StatelessWidget {
  const GrainMartPOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrainMart POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const HomeScreen(),
    );
  }
}

// Product Model
class Product {
  final String id;
  final String name;
  final String code;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.image,
  });
}

// Cart Item Model
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// Cart Provider (Simple State Management)
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  double _discount = 0.0;
  final double _taxRate = 0.05; // 5%

  List<CartItem> get items => _items;
  double get discount => _discount;
  double get taxRate => _taxRate;

  double get subtotal {
    return _items.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  double get tax {
    return (subtotal - _discount) * _taxRate;
  }

  double get total {
    double beforeTax = subtotal - _discount;
    double withTax = beforeTax + tax;
    // Round off to nearest rupee
    return withTax.roundToDouble();
  }

  double get roundOff {
    double beforeRounding = subtotal - _discount + tax;
    return total - beforeRounding;
  }

  void addProduct(Product product) {
    int existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    int index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void setDiscount(double discount) {
    _discount = discount;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _discount = 0.0;
    notifyListeners();
  }

  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartProvider cartProvider = CartProvider();
  String selectedCategory = 'All Rice';

  // Sample products data with local asset images
  final List<Product> products = [
    Product(
      id: 'RICE001',
      name: 'Premium Basmati Rice',
      code: 'RICE001',
      price: 499.00,
      image: 'assets/images/premium_basmati.jpg',
    ),
    Product(
      id: 'RICE002',
      name: 'Sona Masoori Rice',
      code: 'RICE002',
      price: 599.00,
      image: 'assets/images/premium_basmati.jpg',
    ),
    Product(
      id: 'RICE003',
      name: 'Idli Rice',
      code: 'RICE003',
      price: 399.00,
      image: 'assets/images/idli_rice.jpg',
    ),
    Product(
      id: 'RICE004',
      name: 'Parboiled Rice',
      code: 'RICE004',
      price: 449.00,
      image: 'assets/images/parboiled.jpg',
    ),
    Product(
      id: 'RICE005',
      name: 'Brown Rice',
      code: 'RICE005',
      price: 699.00,
      image: 'assets/images/brown_rice.jpg',
    ),
    Product(
      id: 'RICE006',
      name: 'Broken Rice',
      code: 'RICE006',
      price: 299.00,
      image: 'assets/images/broken_rice.jpg',
    ),
    Product(
      id: 'RICE007',
      name: 'Jasmine Rice',
      code: 'RICE007',
      price: 799.00,
      image: 'assets/images/premium_basmati.jpg',
    ),
    Product(
      id: 'RICE008',
      name: 'Red Rice',
      code: 'RICE008',
      price: 549.00,
      image: 'assets/images/brown_rice.jpg',
    ),
    Product(
      id: 'RICE009',
      name: 'Black Rice',
      code: 'RICE009',
      price: 899.00,
      image: 'assets/images/brown_rice.jpg',
    ),
    Product(
      id: 'RICE010',
      name: 'Wild Rice',
      code: 'RICE010',
      price: 1299.00,
      image: 'assets/images/parboiled.jpg',
    ),
    Product(
      id: 'RICE011',
      name: 'Arborio Rice',
      code: 'RICE011',
      price: 1099.00,
      image: 'assets/images/idli_rice.jpg',
    ),
    Product(
      id: 'RICE012',
      name: 'Sticky Rice',
      code: 'RICE012',
      price: 649.00,
      image: 'assets/images/premium_basmati.jpg',
    ),
    Product(
      id: 'RICE013',
      name: 'Long Grain Rice',
      code: 'RICE013',
      price: 429.00,
      image: 'assets/images/broken_rice.jpg',
    ),
    Product(
      id: 'RICE014',
      name: 'Short Grain Rice',
      code: 'RICE014',
      price: 479.00,
      image: 'assets/images/parboiled.jpg',
    ),
    Product(
      id: 'RICE015',
      name: 'Medium Grain Rice',
      code: 'RICE015',
      price: 459.00,
      image: 'assets/images/brown_rice.jpg',
    ),
  ];

  final List<String> categories = [
    'All Rice',
    'Basmati Rice',
    'Sona Masoori',
    'Idli Rice',
    'Parboiled Rice',
    'Raw Rice',
    'Brown Rice',
    'Broken Rice',
  ];

  List<Product> get filteredProducts {
    if (selectedCategory == 'All Rice') {
      return products;
    }
    String filter = selectedCategory.replaceAll(' Rice', '');
    return products.where((product) => product.name.contains(filter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return _buildMobileLayout(context, constraints);
          } else {
            // Updated desktop layout with horizontal categories
            return Row(
              children: [
                // Middle - Products and Search (expanded to take more space)
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      // Top Navigation Bar with Title and Search
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.borderPrimary.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              'GrainMart POS',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Search Bar
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search items, barcode or SKU',
                                    hintStyle: TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: AppColors.textSecondary,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Horizontal Categories
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final isSelected = selectedCategory == category;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: FilterChip(
                                avatar: Icon(
                                  Icons.grain,
                                  size: 20,
                                  color: isSelected
                                      ? AppColors.onPrimary
                                      : AppColors.textSecondary,
                                ),
                                label: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppColors.onPrimary
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  if (selected) {
                                    setState(() {
                                      selectedCategory = category;
                                    });
                                  }
                                },
                                selectedColor: AppColors
                                    .info, // Selected color will be blue
                                backgroundColor: AppColors
                                    .background, // Default background white
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: AppColors.borderPrimary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Products Grid
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: LayoutBuilder(
                            builder: (context, productConstraints) {
                              // Calculate responsive columns based on available width
                              int crossAxisCount =
                                  (productConstraints.maxWidth / 200)
                                      .floor()
                                      .clamp(1, 4);
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                      childAspectRatio: 0.8,
                                    ),
                                itemCount: filteredProducts.length,
                                itemBuilder: (context, index) {
                                  final product = filteredProducts[index];
                                  return _buildProductCard(product);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Right Sidebar - Cart/Bills
                AnimatedBuilder(
                  animation: cartProvider,
                  builder: (context, child) {
                    return Container(
                      width: constraints.maxWidth > 1200 ? 450 : 350,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderPrimary.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(-2, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Header Icons Row - Fixed to full width
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.borderPrimary,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildNavIcon(
                                  Icons.local_shipping,
                                  'Delivery',
                                  () {},
                                ),
                                _buildNavIcon(Icons.receipt, 'Bills', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BillingManagementPage(),
                                    ),
                                  );
                                }),
                                _buildNavIcon(Icons.book, 'Daybook', () {}),
                                _buildNavIcon(
                                  Icons.pause_circle_outline,
                                  'Hold',
                                  () {},
                                ),
                                _buildNavIcon(Icons.inventory_2, 'Product', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ManagementScreen(),
                                    ),
                                  );
                                }),
                                _buildNavIcon(Icons.person, 'Customer', () {}),
                                _buildNavIcon(Icons.inventory, 'Stock', () {}),
                              ],
                            ),
                          ),
                          // Customer Info
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.borderPrimary,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Customer Name',
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.textSecondary,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColors.borderPrimary,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 10,
                                              ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Mobile Number',
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.textSecondary,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColors.borderPrimary,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 10,
                                              ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: AppColors.info,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Cart Header
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.borderPrimary,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Item',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textPrimary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Qty',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textPrimary,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textPrimary,
                                    ),
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 40),
                              ],
                            ),
                          ),
                          // Cart Items
                          Expanded(
                            child: cartProvider.items.isEmpty
                                ? Center(
                                    child: Text(
                                      'No items in cart',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: cartProvider.items.length,
                                    itemBuilder: (context, index) {
                                      final item = cartProvider.items[index];
                                      return _buildCartItem(item);
                                    },
                                  ),
                          ),
                          // Cart Summary
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: AppColors.borderPrimary),
                              ),
                            ),
                            child: Column(
                              children: [
                                _buildSummaryRow(
                                  'Subtotal',
                                  '₹${cartProvider.subtotal.toStringAsFixed(2)}',
                                ),
                                _buildSummaryRow(
                                  'Discount',
                                  '-₹${cartProvider.discount.toStringAsFixed(2)}',
                                  color: AppColors.error,
                                ),
                                _buildSummaryRow(
                                  'Tax (5%)',
                                  '₹${cartProvider.tax.toStringAsFixed(2)}',
                                ),
                                _buildSummaryRow(
                                  'Round Off',
                                  '${cartProvider.roundOff >= 0 ? '+' : ''}₹${cartProvider.roundOff.toStringAsFixed(2)}',
                                ),
                                const Divider(),
                                _buildSummaryRow(
                                  'Total',
                                  '₹${cartProvider.total.toStringAsFixed(2)}',
                                  isTotal: true,
                                  color: AppColors.secondary,
                                ),
                                const SizedBox(height: 16),
                                // Action Buttons
                                _buildActionButton(
                                  'Hold',
                                  AppColors.textTertiary,
                                  cartProvider.items.isEmpty,
                                  () {},
                                ),
                                const SizedBox(height: 8),
                                _buildActionButton(
                                  'Add Discount',
                                  AppColors.info,
                                  cartProvider.items.isEmpty,
                                  () {},
                                ),
                                const SizedBox(height: 8),
                                _buildActionButton(
                                  'Confirm Payment',
                                  AppColors.secondary,
                                  cartProvider.items.isEmpty,
                                  () {
                                    _showPaymentConfirmation();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        // Top AppBar for mobile
        AppBar(
          title: Text(
            'GrainMart POS',
            style: TextStyle(color: AppColors.textPrimary),
          ),
          backgroundColor: AppColors.surface,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: AppColors.textPrimary),
              onPressed: () {
                // Show cart in a bottom sheet or navigate to cart screen
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => DraggableScrollableSheet(
                    initialChildSize: 0.9,
                    minChildSize: 0.5,
                    maxChildSize: 0.9,
                    expand: false,
                    builder: (context, scrollController) =>
                        _buildCartSection(scrollController),
                  ),
                );
              },
            ),
          ],
        ),
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search items, barcode or SKU',
                hintStyle: TextStyle(color: AppColors.textSecondary),
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
        // Categories as horizontal scroll
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FilterChip(
                  avatar: Icon(
                    Icons.grain,
                    size: 20,
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.textSecondary,
                  ),
                  label: Text(
                    category,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.onPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }
                  },
                  selectedColor: AppColors.info, // Selected color will be blue
                  backgroundColor:
                      AppColors.background, // Default background white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: AppColors.borderPrimary),
                  ),
                ),
              );
            },
          ),
        ),
        // Products Grid for mobile
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns for mobile
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return _buildProductCard(product);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartSection(ScrollController scrollController) {
    return AnimatedBuilder(
      animation: cartProvider,
      builder: (context, child) {
        return ListView(
          controller: scrollController,
          children: [
            // Header Icons Row (adapted for mobile)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                children: [
                  _buildNavIcon(Icons.local_shipping, 'Delivery', () {}),
                  _buildNavIcon(Icons.receipt, 'Bills', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BillingManagementPage(),
                      ),
                    );
                  }),
                  _buildNavIcon(Icons.book, 'Daybook', () {}),
                  _buildNavIcon(Icons.pause_circle_outline, 'Hold', () {}),
                  _buildNavIcon(Icons.inventory_2, 'Product', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManagementScreen(),
                      ),
                    );
                  }),
                  _buildNavIcon(Icons.person, 'Customer', () {}),
                  _buildNavIcon(Icons.inventory, 'Stock', () {}),
                ],
              ),
            ),
            // Customer Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Customer Name',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderPrimary,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderPrimary,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColors.info),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Cart Items
            if (cartProvider.items.isEmpty)
              Center(
                child: Text(
                  'No items in cart',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return _buildCartItem(item);
                },
              ),
            // Cart Summary
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildSummaryRow(
                    'Subtotal',
                    '₹${cartProvider.subtotal.toStringAsFixed(2)}',
                  ),
                  _buildSummaryRow(
                    'Discount',
                    '-₹${cartProvider.discount.toStringAsFixed(2)}',
                    color: AppColors.error,
                  ),
                  _buildSummaryRow(
                    'Tax (5%)',
                    '₹${cartProvider.tax.toStringAsFixed(2)}',
                  ),
                  _buildSummaryRow(
                    'Round Off',
                    '${cartProvider.roundOff >= 0 ? '+' : ''}₹${cartProvider.roundOff.toStringAsFixed(2)}',
                  ),
                  const Divider(),
                  _buildSummaryRow(
                    'Total',
                    '₹${cartProvider.total.toStringAsFixed(2)}',
                    isTotal: true,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(height: 16),
                  _buildActionButton(
                    'Hold',
                    AppColors.textTertiary,
                    cartProvider.items.isEmpty,
                    () {},
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    'Add Discount',
                    AppColors.info,
                    cartProvider.items.isEmpty,
                    () {},
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    'Confirm Payment',
                    AppColors.secondary,
                    cartProvider.items.isEmpty,
                    () {
                      _showPaymentConfirmation();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButton(
    String text,
    Color color,
    bool isDisabled,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? AppColors.textTertiary.withOpacity(0.5)
              : color,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isDisabled ? AppColors.textSecondary : AppColors.onPrimary,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.info, size: 20),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.info,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.background,
                      child: Center(
                        child: Text(
                          '🌾',
                          style: TextStyle(
                            fontSize: 40,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Product Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    product.code,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '₹${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 28,
                        child: ElevatedButton(
                          onPressed: () {
                            cartProvider.addProduct(product);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.info,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderPrimary)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.product.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (item.quantity > 1) {
                      cartProvider.updateQuantity(
                        item.product.id,
                        item.quantity - 1,
                      );
                    }
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${item.quantity}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartProvider.updateQuantity(
                      item.product.id,
                      item.quantity + 1,
                    );
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '₹${(item.product.price * item.quantity).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {
                cartProvider.removeProduct(item.product.id);
              },
              icon: Icon(Icons.delete, color: AppColors.error, size: 18),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isTotal ? 18 : 15,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
                color: color ?? AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: isTotal ? 18 : 15,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
                color: color ?? AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.secondary.withOpacity(0.05),
                      AppColors.surface,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header with icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.payment,
                        color: AppColors.onSecondary,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Title
                    Text(
                      'Payment Confirmation',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    Text(
                      'Please confirm your payment details',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Payment details card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderPrimary),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderPrimary.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildPaymentDetailRow(
                            'Total Items:',
                            '${cartProvider.totalItems}',
                            Icons.shopping_cart,
                          ),
                          const SizedBox(height: 12),
                          _buildPaymentDetailRow(
                            'Subtotal:',
                            '₹${cartProvider.subtotal.toStringAsFixed(2)}',
                            Icons.calculate,
                          ),
                          const SizedBox(height: 8),
                          _buildPaymentDetailRow(
                            'Discount:',
                            '-₹${cartProvider.discount.toStringAsFixed(2)}',
                            Icons.discount,
                            color: AppColors.error,
                          ),
                          const SizedBox(height: 8),
                          _buildPaymentDetailRow(
                            'Tax (5%):',
                            '₹${cartProvider.tax.toStringAsFixed(2)}',
                            Icons.receipt,
                          ),
                          const Divider(height: 24, thickness: 1.5),
                          _buildPaymentDetailRow(
                            'Total Amount:',
                            '₹${cartProvider.total.toStringAsFixed(2)}',
                            Icons.attach_money,
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.textTertiary),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              cartProvider.clearCart();
                              _showSuccessMessage();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              'Confirm Payment',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentDetailRow(
    String label,
    String value,
    IconData icon, {
    bool isTotal = false,
    Color? color,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color:
              color ??
              (isTotal ? AppColors.secondary : AppColors.textSecondary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color:
                  color ??
                  (isTotal ? AppColors.secondary : AppColors.textPrimary),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color:
                  color ??
                  (isTotal ? AppColors.secondary : AppColors.textPrimary),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.check_circle,
                color: AppColors.secondary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Payment confirmed successfully! 🎉',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSecondary,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.secondary,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
