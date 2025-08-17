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
  static const Color overdueRed = Color(0xFFEA4335);
  static const Color overdueRedBackground = Color(0xFFFCE8E6);
}

// Data model for the billing information
class BillingData {
  final String billNo;
  final String customerName;
  final double taxAmount;
  final double totalAmount;
  final String status;

  BillingData(this.billNo, this.customerName, this.taxAmount, this.totalAmount, this.status);
}

class BillingManagementPage extends StatefulWidget {
  const BillingManagementPage({super.key});

  @override
  State<BillingManagementPage> createState() => _BillingManagementPageState();
}

class _BillingManagementPageState extends State<BillingManagementPage> with SingleTickerProviderStateMixin {
  // A list to hold the billing data. In a real app, this would come from a database or API.
  final List<BillingData> _bills = [
    BillingData('INV-2025-001', 'Rajesh Kumar', 18456.78, 121456.78, 'Paid'),
    BillingData('INV-2025-002', 'Priya Sharma', 9234.50, 67234.50, 'Pending'),
    BillingData('INV-2025-003', 'Amit Patel', 15678.90, 98678.90, 'Overdue'),
    BillingData('INV-2025-004', 'Sunita Singh', 22345.67, 145345.67, 'Paid'),
    BillingData('INV-2025-005', 'Vikash Gupta', 11789.12, 78789.12, 'Pending'),
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
      // CHANGE 1: Wrapped the body in a Center and ConstrainedBox to make the content
      // wider on large screens, addressing the "half the page" issue.
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb
                const Text(
                  'Dashboard > Billing',
                  style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
                ),
                const SizedBox(height: 16),

                // Page Title
                const Text(
                  'Billing Management',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Tab Bar and Action Buttons
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.primaryColor,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.secondaryTextColor,
                          tabs: const [
                            Tab(text: 'All'),
                            Tab(text: 'Orders'),
                            Tab(text: 'Advance Payment'),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: AppColors.borderColor),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildFilterAndActionButtonRow(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Responsive Table/List View
                _buildResponsiveTable(context),
                const SizedBox(height: 24),

                // Pagination
                _buildPagination(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build the filters and 'Add Bill' button
  Widget _buildFilterAndActionButtonRow(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 800;
    return Flex(
      direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search bar
        Flexible(
          flex: isLargeScreen ? 3 : 0,
          child: Container(
            height: 48,
            margin: EdgeInsets.only(bottom: isLargeScreen ? 0 : 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search bills...',
                prefixIcon: const Icon(Icons.search, color: AppColors.secondaryTextColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        if (isLargeScreen) const SizedBox(width: 16),

        // Filter dropdowns and Add Bill button
        Flexible(
          flex: isLargeScreen ? 2 : 0,
          child: Flex(
            direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildFilterDropdown('Status', isLargeScreen),
              if (isLargeScreen) const SizedBox(width: 16),
              _buildFilterDropdown('Date Range', isLargeScreen),
              if (isLargeScreen) const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 20),
                label: const Text('Add Bill'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper widget for the filter dropdowns
  Widget _buildFilterDropdown(String label, bool isLargeScreen) {
    return Container(
      width: isLargeScreen ? 150 : double.infinity,
      height: 48,
      margin: EdgeInsets.only(bottom: isLargeScreen ? 0 : 16),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: label,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.secondaryTextColor),
          isExpanded: true,
          items: <String>[label].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: AppColors.secondaryTextColor)),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
      ),
    );
  }

  // Helper function to build the responsive table or list view
  Widget _buildResponsiveTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: _buildDesktopTable(),
    );
  }

  // The DataTable for large screens
  Widget _buildDesktopTable() {
    // CHANGE 2: Wrapped the DataTable in a SizedBox with infinite width. This makes
    // the table stretch to fill its parent container, using the available space.
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columnSpacing: 32,
        headingRowColor: MaterialStateProperty.all(Colors.grey[50]),
        columns: const [
          DataColumn(label: Text('Bill No.', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
          DataColumn(label: Text('Customer Name', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
          DataColumn(label: Text('Tax Amount (₹)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
          DataColumn(label: Text('Total Amount (₹)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
          DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor))),
        ],
        rows: _bills.map((bill) {
          return DataRow(
            cells: [
              DataCell(Text(bill.billNo, style: const TextStyle(color: AppColors.secondaryTextColor))),
              DataCell(Text(bill.customerName, style: const TextStyle(color: AppColors.textColor))),
              DataCell(Text(bill.taxAmount.toStringAsFixed(2), style: const TextStyle(color: AppColors.secondaryTextColor))),
              DataCell(Text(bill.totalAmount.toStringAsFixed(2), style: const TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold))),
              DataCell(_buildStatusChip(bill.status)),
              DataCell(
                Row(
                  children: [
                    _buildActionButton('Edit', AppColors.primaryColor),
                    const SizedBox(width: 8),
                    _buildActionButton('Delete', AppColors.overdueRed),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // Helper widget for the status chips
  Widget _buildStatusChip(String status) {
    Color chipColor;
    Color textColor;

    switch (status) {
      case 'Paid':
        chipColor = AppColors.paidGreenBackground;
        textColor = AppColors.paidGreen;
        break;
      case 'Pending':
        chipColor = AppColors.pendingOrangeBackground;
        textColor = AppColors.pendingOrange;
        break;
      case 'Overdue':
        chipColor = AppColors.overdueRedBackground;
        textColor = AppColors.overdueRed;
        break;
      default:
        chipColor = Colors.grey[200]!;
        textColor = AppColors.secondaryTextColor;
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
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  // Helper widget for the action buttons in the table
  Widget _buildActionButton(String text, Color color) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color.withOpacity(0.5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text),
    );
  }

  // Widget to build the pagination row
  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Showing 1-10 of 250 bills', style: TextStyle(color: AppColors.secondaryTextColor)),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: AppColors.secondaryTextColor),
              onPressed: () {},
            ),
            _buildPageButton('1', isSelected: true),
            _buildPageButton('2'),
            _buildPageButton('3'),
            const SizedBox(width: 8),
            const Text('...', style: TextStyle(color: AppColors.secondaryTextColor)),
            const SizedBox(width: 8),
            _buildPageButton('25'),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  // Helper widget for pagination buttons
  Widget _buildPageButton(String pageNumber, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
          foregroundColor: isSelected ? Colors.white : AppColors.secondaryTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isSelected ? BorderSide.none : const BorderSide(color: AppColors.borderColor),
          ),
          minimumSize: const Size(40, 40),
        ),
        child: Text(pageNumber),
      ),
    );
  }
}