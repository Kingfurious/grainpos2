import 'package:flutter/material.dart';

class AddVariantScreen extends StatelessWidget {
  const AddVariantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Variant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SizedBox(
            width: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Create a new variant for Premium Basmati Rice', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 24),
                // Image Upload Placeholder
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_outlined, size: 40, color: Colors.blue),
                            SizedBox(height: 8),
                            Text('Upload Variant Image'),
                            Text('JPG, PNG up to 2MB', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Variant Image (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Upload a clear variant image to distinguish from other sizes'),
                            SizedBox(height: 8),
                            Text('• Recommended size: 400x400px'),
                            Text('• Formats: JPG, PNG'),
                            Text('• Maximum size: 2MB'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Form Fields
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildDropdownField('Size *', 'Select size')),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTextField('HSN Code *', '11042000')),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTextField('Units *', 'Enter quantity', helperText: 'Number of packages/units in stock')),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTextField('Tax Rate (%) *', '0.00', helperText: 'GST/Tax percentage for this variant')),
                  ],
                ),
                const SizedBox(height: 32),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
                    const SizedBox(width: 16),
                    ElevatedButton(onPressed: () {}, child: const Text('Save Variant')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {String? helperText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            helperText: helperText,
            helperStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(hintText: hint),
          items: const [
            DropdownMenuItem(value: '1kg', child: Text('1 kg')),
            DropdownMenuItem(value: '2kg', child: Text('2 kg')),
            DropdownMenuItem(value: '5kg', child: Text('5 kg')),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
