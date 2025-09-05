import 'package:flutter/material.dart';

import '../../business/expense_controller.dart';
import '../../data/const/locals.dart';
import '../../data/localization/local.dart';
import 'category_button.dart';
import 'date_picker.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    var loc = AppLocalizations(currentLocale);
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.translate(addExpense),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16),
              TextField(
                controller: ExpenseController().titleController,
                decoration: InputDecoration(labelText: loc.translate(titleHint)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      controller: ExpenseController().amountController,
                      decoration: InputDecoration(labelText: loc.translate(amountHint)),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  AppDatePicker(),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryDropDownButton(),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ExpenseController().clearInputs();
                        },
                        child: Text(
                          loc.translate(cancel),
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle save action
                          if (!ExpenseController().validateInputs()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(loc.translate(validationError), style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                duration: Duration(seconds: 3), // 2 seconds
                                backgroundColor: Theme.of(context).colorScheme.error,
                                shape: BeveledRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
                              ),
                            );
                            return;
                          }
                          ExpenseController().onSave();
                          Navigator.of(context).pop();
                        },
                        child: Text(loc.translate(save)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
