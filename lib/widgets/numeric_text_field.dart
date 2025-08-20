import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopeasy/core/constants/app_sizes.dart';

class NumericTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool allowDecimal;
  final String? Function(String?)? validator;

  const NumericTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.allowDecimal = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge, // Using labelLarge style
        ),
        const SizedBox(height: AppSizes.sm), // Consistent spacing
        TextFormField(
          controller: controller,
          keyboardType: allowDecimal
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.number,
          inputFormatters: [
            if (allowDecimal)
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+(\.?[0-9]*)'))
            else
              FilteringTextInputFormatter.digitsOnly,
          ],
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
              borderSide: BorderSide.none, // No border as per design
            ),
            filled: true,
            fillColor: Colors.grey[100], // Light grey background
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSizes.md,
              horizontal: AppSizes.md,
            ), // Padding
          ),
        ),
      ],
    );
  }
}

