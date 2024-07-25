import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({
    super.key,
    required this.textTheme,
    required this.title,
    required this.details,
  });

  final TextTheme textTheme;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: textTheme.titleMedium,
        children: <TextSpan>[
          TextSpan(
            text: details,
            style: textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
