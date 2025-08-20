import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopeasy/core/constants/app_sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
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
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
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

