import 'package:fatorty/business/expense_controller.dart';
import 'package:flutter/material.dart';

import '../../data/const/locals.dart';
import '../../data/localization/local.dart';
import '../../data/models/expense.dart';

class CategoryDropDownButton extends StatefulWidget {
  const CategoryDropDownButton({super.key});

  @override
  State<CategoryDropDownButton> createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  ExpenseController controller = ExpenseController();
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    var loc = AppLocalizations(currentLocale);
    return DropdownButton<Category>(
      value: controller.selectedCategory,
      hint: Text(loc.translate(categoryHint)),
      isExpanded: false,
      items: Category.values.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(loc.translate(category.name)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          controller.selectedCategory = value;
        });
      },
    );
  }
}
