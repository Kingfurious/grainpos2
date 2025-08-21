import 'package:flutter/material.dart';
import 'package:shopeasy/core/constants/app_colors.dart';

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
    OrderData(
      '#ORD-001',
      'Rajesh Kumar',
      '15 Jan 2024',
      12345.67,
      'Paid',
      'Delivered',
    ),
    OrderData(
      '#ORD-002',
      'Priya Sharma',
      '14 Jan 2024',
      8750.00,
      'Pending',
      'Shipped',
    ),
    OrderData(
      '#ORD-003',
      'Amit Patel',
      '13 Jan 2024',
      15999.99,
      'Failed',
      'Cancelled',
    ),
    OrderData(
      '#ORD-004',
      'Sneha Gupta',
      '12 Jan 2024',
      5250.00,
      'Paid',
      'Pending',
    ),
    OrderData(
      '#ORD-005',
      'Vikram Singh',
      '11 Jan 2024',
      22100.50,
      'Paid',
      'Shipped',
    ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;
        final double padding = isMobile ? 12.0 : 24.0;
        final double fontSize = isMobile ? 12.0 : 14.0;
        final double tabGap = isMobile ? 16.0 : 40.0;

        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Orders Management',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
            bottom: isMobile
                ? TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: 'Orders'),
                      Tab(text: 'Advance Payment'),
                    ],
                  )
                : null,
          ),
          body: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                // Tab Bar and Content
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        // Tabs (only for desktop)
                        if (!isMobile)
                          Container(
                            padding: EdgeInsets.all(padding),
                            child: Row(
                              children: [
                                _buildTab('All', true, tabGap),
                                SizedBox(width: tabGap),
                                _buildTab('Orders', false, tabGap),
                                SizedBox(width: tabGap),
                                _buildTab('Advance Payment', false, tabGap),
                              ],
                            ),
                          ),
                        if (!isMobile)
                          Divider(height: 1, color: AppColors.borderPrimary),
                        // Search and Filter Row/Column
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: isMobile
                              ? Column(
                                  children: [
                                    // Search Bar
                                    Container(
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
                                          hintText: 'Search orders...',
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
                                    const SizedBox(height: 16),
                                    // Order Status Filter
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
                                        child: DropdownButton(
                                          value: 'Order Status',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.textSecondary,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: fontSize,
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Order Status',
                                              child: Text('Order Status'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Paid',
                                              child: Text('Paid'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Pending',
                                              child: Text('Pending'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Failed',
                                              child: Text('Failed'),
                                            ),
                                          ],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Date Filter
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
                                      child: Row(
                                        children: [
                                          Text(
                                            'dd/mm/yyyy',
                                            style: TextStyle(
                                              color: AppColors.textSecondary,
                                              fontSize: fontSize,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: AppColors.textSecondary,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: AppColors.borderPrimary,
                                          ),
                                        ),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Search orders...',
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
                                    // Order Status Filter
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
                                        child: DropdownButton(
                                          value: 'Order Status',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.textSecondary,
                                          ),
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: fontSize,
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Order Status',
                                              child: Text('Order Status'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Paid',
                                              child: Text('Paid'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Pending',
                                              child: Text('Pending'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Failed',
                                              child: Text('Failed'),
                                            ),
                                          ],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Date Filter
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
                                      child: Row(
                                        children: [
                                          Text(
                                            'dd/mm/yyyy',
                                            style: TextStyle(
                                              color: AppColors.textSecondary,
                                              fontSize: fontSize,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: AppColors.textSecondary,
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
                              if (!isMobile)
                                // Table Header
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: padding,
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
                                      _buildTableHeader(
                                        'Order No.',
                                        flex: 2,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Customer Name',
                                        flex: 3,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Order Date',
                                        flex: 2,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Total Amount',
                                        flex: 2,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Payment Status',
                                        flex: 2,
                                        centered: true,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Delivery Status',
                                        flex: 2,
                                        centered: true,
                                        fontSize: fontSize,
                                      ),
                                      _buildTableHeader(
                                        'Actions',
                                        flex: 4,
                                        centered: true,
                                        fontSize: fontSize,
                                      ),
                                    ],
                                  ),
                                ),
                              // Table Rows or Mobile Cards
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _orders.length,
                                  itemBuilder: (context, index) {
                                    final order = _orders[index];
                                    return isMobile
                                        ? _buildMobileCard(order, fontSize)
                                        : _buildTableRow(
                                            order,
                                            index,
                                            padding,
                                            fontSize,
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Pagination
                        Container(
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.borderPrimary),
                            ),
                          ),
                          child: isMobile
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: AppColors.textSecondary,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      '1 / 50',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: AppColors.textSecondary,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Showing 1-10 of 500 orders',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: AppColors.textSecondary,
                                          ),
                                          onPressed: () {},
                                        ),
                                        _buildPageButton('1', isSelected: true),
                                        _buildPageButton('2'),
                                        _buildPageButton('3'),
                                        Text(
                                          '...',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                        _buildPageButton('50'),
                                        IconButton(
                                          icon: Icon(
                                            Icons.chevron_right,
                                            color: AppColors.textSecondary,
                                          ),
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
      },
    );
  }

  Widget _buildTab(String text, bool isSelected, double tabGap) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: text.length * 8.0 + 16,
            color: isSelected ? AppColors.primary : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(
    String text, {
    int flex = 1,
    bool centered = false,
    required double fontSize,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: centered ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildTableRow(
    OrderData order,
    int index,
    double padding,
    double fontSize,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderPrimary.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                order.orderNo,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                order.customerName,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                order.orderDate,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                '₹${order.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: _buildStatusChip(
                order.paymentStatus,
                isPaymentStatus: true,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: _buildStatusChip(
                order.deliveryStatus,
                isPaymentStatus: false,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton('View', AppColors.info, outlined: true),
                  const SizedBox(width: 12),
                  _buildActionButton('Edit', AppColors.info, outlined: false),
                  const SizedBox(width: 12),
                  _buildActionButton(
                    'Cancel',
                    AppColors.error,
                    outlined: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCard(OrderData order, double fontSize) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          order.orderNo,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order.customerName, style: TextStyle(fontSize: fontSize)),
            Text(
              order.orderDate,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: fontSize,
              ),
            ),
            Text(
              '₹${order.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                _buildStatusChip(order.paymentStatus, isPaymentStatus: true),
                const SizedBox(width: 8),
                _buildStatusChip(order.deliveryStatus, isPaymentStatus: false),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            // Handle actions here
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'View', child: Text('View')),
            const PopupMenuItem(value: 'Edit', child: Text('Edit')),
            const PopupMenuItem(value: 'Cancel', child: Text('Cancel')),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status, {required bool isPaymentStatus}) {
    Color chipColor;
    Color textColor;
    if (isPaymentStatus) {
      switch (status) {
        case 'Paid':
          chipColor = AppColors.secondary.withOpacity(0.1);
          textColor = AppColors.secondary;
          break;
        case 'Pending':
          chipColor = AppColors.warning.withOpacity(0.1);
          textColor = AppColors.warning;
          break;
        case 'Failed':
          chipColor = AppColors.error.withOpacity(0.1);
          textColor = AppColors.error;
          break;
        default:
          chipColor = AppColors.borderPrimary.withOpacity(0.5);
          textColor = AppColors.textSecondary;
      }
    } else {
      switch (status) {
        case 'Delivered':
          chipColor = AppColors.secondary.withOpacity(0.1);
          textColor = AppColors.secondary;
          break;
        case 'Shipped':
          chipColor = AppColors.info.withOpacity(0.1);
          textColor = AppColors.info;
          break;
        case 'Cancelled':
          chipColor = AppColors.error.withOpacity(0.1);
          textColor = AppColors.error;
          break;
        case 'Pending':
          chipColor = AppColors.warning.withOpacity(0.1);
          textColor = AppColors.warning;
          break;
        default:
          chipColor = AppColors.borderPrimary.withOpacity(0.5);
          textColor = AppColors.textSecondary;
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

  Widget _buildActionButton(
    String text,
    Color color, {
    required bool outlined,
  }) {
    return SizedBox(
      height: 36,
      width: 70,
      child: outlined
          ? OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                elevation: 0,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
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
          backgroundColor: isSelected ? AppColors.primary : Colors.transparent,
          foregroundColor: isSelected
              ? AppColors.onPrimary
              : AppColors.textSecondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
