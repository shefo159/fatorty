import 'package:fatorty/business/expense_controller.dart';
import 'package:flutter/material.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({super.key});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  ExpenseController controller = ExpenseController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: controller.selectedDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2100),
        );
        if (selectedDate != null) {
         setState(() {
           controller.selectedDate=selectedDate;
         });
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(controller.getFormattedDate(controller.selectedDate), style: theme.textTheme.bodyLarge),
          SizedBox(width: 8),
          Icon(Icons.date_range, color: theme.colorScheme.inverseSurface),
        ],
      ),
    );
  }
}
