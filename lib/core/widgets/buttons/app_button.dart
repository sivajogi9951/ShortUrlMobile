import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:short_url/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color color;
  final double? height;
  final double width;
  final TextStyle? textStyle;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color = AppColors.primaryColor,
    this.height=42,
    this.width=double.infinity,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Full width
      height: height,
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon, size: 20) : SizedBox.shrink(),
        label: Text(
          label,
          style: textStyle ?? GoogleFonts.roboto(fontSize: 16, color: Colors.white),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
