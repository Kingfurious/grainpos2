import 'package:flutter/material.dart';

// Custom color class for the UI
class AppColors {
  static const Color primaryColor = Color(0xFF0D63F3);
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color textColor = Color(0xFF202124);
  static const Color secondaryTextColor = Color(0xFF5F6368);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color paidGreen = Color(0xFF34A853);
  static const Color paidGreenBackground = Color(0xFFE6F4EA);
  static const Color pendingOrange = Color(0xFFFBBC04);
  static const Color pendingOrangeBackground = Color(0xFFFFF8E1);
  static const Color failedRed = Color(0xFFEA4335);
  static const Color failedRedBackground = Color(0xFFFFEBEE);
  static const Color deliveredGreen = Color(0xFF34A853);
  static const Color deliveredGreenBackground = Color(0xFFE6F4EA);
  static const Color shippedBlue = Color(0xFF4285F4);
  static const Color shippedBlueBackground = Color(0xFFE3F2FD);
  static const Color cancelledRed = Color(0xFFEA4335);
  static const Color cancelledRedBackground = Color(0xFFFFEBEE);
}

// Data model for the order information
class OrderData {
  final String orderNo;
  final String customerName;
  final String orderDate;
  final double totalAmount;
  final String paymentStatus;
  final String deliveryStatus;

  OrderData(
      this.orderNo,
      this.customerName,
      this.orderDate,
      this.totalAmount,
      this.paymentStatus,
      this.deliveryStatus,
      );
}

class BillingManagementPage extends StatefulWidget {
  const BillingManagementPage({super.key});

  @override
  State<BillingManagementPage> createState() => _BillingManagementPageState();
}

class _BillingManagementPageState extends State<BillingManagementPage>
    with SingleTickerProviderStateMixin {
  // A list to hold the order data
  final List<OrderData> _orders = [
    OrderData('#ORD-001', 'Rajesh Kumar', '15 Jan 2024', 12345.67, 'Paid', 'Delivered'),
    OrderData('#ORD-002', 'Priya Sharma', '14 Jan 2024', 8750.00, 'Pending', 'Shipped'),
    OrderData('#ORD-003', 'Amit Patel', '13 Jan 2024', 15999.99, 'Failed', 'Cancelled'),
    OrderData('#ORD-004', 'Sneha Gupta', '12 Jan 2024', 5250.00, 'Paid', 'Pending'),
    OrderData('#ORD-005', 'Vikram Singh', '11 Jan 2024', 22100.50, 'Paid', 'Shipped'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          'Orders Management',
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
          children: [
            // Tab Bar and Content
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
                    // Tabs
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        children: [
                          _buildTab('All', true),
                          const SizedBox(width: 40),
                          _buildTab('Orders', false),
                          const SizedBox(width: 40),
                          _buildTab('Advance Payment', false),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: AppColors.borderColor),

                    // Search and Filter Row
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
                                  hintText: 'Search orders...',
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

                          // Order Status Filter
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
                                value: 'Order Status',
                                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryTextColor),
                                style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
                                items: const [
                                  DropdownMenuItem(value: 'Order Status', child: Text('Order Status')),
                                  DropdownMenuItem(value: 'Paid', child: Text('Paid')),
                                  DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                                  DropdownMenuItem(value: 'Failed', child: Text('Failed')),
                                ],
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Date Filter
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'dd/mm/yyyy',
                                  style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.calendar_today, size: 16, color: AppColors.secondaryTextColor),
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
                                _buildTableHeader('Order No.', flex: 2),
                                _buildTableHeader('Customer Name', flex: 3),
                                _buildTableHeader('Order Date', flex: 2),
                                _buildTableHeader('Total Amount', flex: 2),
                                _buildTableHeader('Payment Status', flex: 2, centered: true),
                                _buildTableHeader('Delivery Status', flex: 2, centered: true),
                                _buildTableHeader('Actions', flex: 4, centered: true),
                              ],
                            ),
                          ),

                          // Table Rows
                          Expanded(
                            child: ListView.builder(
                              itemCount: _orders.length,
                              itemBuilder: (context, index) {
                                final order = _orders[index];
                                return _buildTableRow(order, index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Pagination
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
                            'Showing 1-10 of 500 orders',
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.chevron_left, color: AppColors.secondaryTextColor),
                                onPressed: () {},
                              ),
                              _buildPageButton('1', isSelected: true),
                              _buildPageButton('2'),
                              _buildPageButton('3'),
                              Text('...', style: TextStyle(color: AppColors.secondaryTextColor)),
                              _buildPageButton('50'),
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
                                onPressed: () {},
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

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primaryColor : AppColors.secondaryTextColor,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: text.length * 8.0 + 16,
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
        ],
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

  Widget _buildTableRow(OrderData order, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          // Order No
          Expanded(
            flex: 2,
            child: Text(
              order.orderNo,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Customer Name
          Expanded(
            flex: 3,
            child: Text(
              order.customerName,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
          ),

          // Order Date
          Expanded(
            flex: 2,
            child: Text(
              order.orderDate,
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 14,
              ),
            ),
          ),

          // Total Amount
          Expanded(
            flex: 2,
            child: Text(
              '₹${order.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Payment Status
          Expanded(
            flex: 2,
            child: Center(
              child: _buildStatusChip(order.paymentStatus, isPaymentStatus: true),
            ),
          ),

          // Delivery Status
          Expanded(
            flex: 2,
            child: Center(
              child: _buildStatusChip(order.deliveryStatus, isPaymentStatus: false),
            ),
          ),

          // Actions
          Expanded(
            flex: 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton('View', AppColors.primaryColor, outlined: true),
                  const SizedBox(width: 12),
                  _buildActionButton('Edit', AppColors.primaryColor, outlined: false),
                  const SizedBox(width: 12),
                  _buildActionButton('Cancel', AppColors.failedRed, outlined: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status, {required bool isPaymentStatus}) {
    Color chipColor;
    Color textColor;

    if (isPaymentStatus) {
      switch (status) {
        case 'Paid':
          chipColor = AppColors.paidGreenBackground;
          textColor = AppColors.paidGreen;
          break;
        case 'Pending':
          chipColor = AppColors.pendingOrangeBackground;
          textColor = AppColors.pendingOrange;
          break;
        case 'Failed':
          chipColor = AppColors.failedRedBackground;
          textColor = AppColors.failedRed;
          break;
        default:
          chipColor = Colors.grey[200]!;
          textColor = AppColors.secondaryTextColor;
      }
    } else {
      switch (status) {
        case 'Delivered':
          chipColor = AppColors.deliveredGreenBackground;
          textColor = AppColors.deliveredGreen;
          break;
        case 'Shipped':
          chipColor = AppColors.shippedBlueBackground;
          textColor = AppColors.shippedBlue;
          break;
        case 'Cancelled':
          chipColor = AppColors.cancelledRedBackground;
          textColor = AppColors.cancelledRed;
          break;
        case 'Pending':
          chipColor = AppColors.pendingOrangeBackground;
          textColor = AppColors.pendingOrange;
          break;
        default:
          chipColor = Colors.grey[200]!;
          textColor = AppColors.secondaryTextColor;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
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

  Widget _buildPageButton(String pageNumber, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : Colors.transparent,
          foregroundColor: isSelected ? Colors.white : AppColors.secondaryTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(40, 40),
        ),
        child: Text(
          pageNumber,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}