import 'package:fatorty/presentation/widgets/chart.dart';
import 'package:fatorty/presentation/widgets/expense.dart';
import 'package:flutter/material.dart';
import '../../business/expense_controller.dart';
import '../../data/const/locals.dart';
import '../../data/localization/local.dart';
import '../../data/models/expense.dart';
import '../widgets/add_expenses.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('building expenses page');
    ExpenseController controller = ExpenseController();
    controller.getAllExpenses();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Locale currentLocale = Localizations.localeOf(context);
    var loc = AppLocalizations(currentLocale);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(loc.translate(appTitle), style: Theme.of(context).textTheme.titleLarge),
        leading: SizedBox(),
        leadingWidth: 16,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text(loc.translate(confirm),style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.error)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              content: Text(loc.translate(confirmClearExpenses),style: Theme.of(context).textTheme.bodyLarge),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text(loc.translate(cancel),style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.primary))),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                  controller.clearAllExpenses();
                }, child: Text(loc.translate(confirm),style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.error))),
              ],
            ));
            //controller.clearAllExpenses();
          }, icon: Icon(Icons.delete)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add expense action
              scaffoldKey.currentState!.showBottomSheet(
                    (context) => AddExpenses(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpensesChart(),
            SizedBox(height: 30),
            StreamBuilder<List<Expense>>(
              stream: controller.streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text(loc.translate(noExpenses)));
                }

                final expenses = snapshot.data!;

                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key('$index'),
                      onDismissed: (direction) {
                        // TODO: handle delete
                        controller.removeExpense(expenses[index].id!);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            loc.translate(delete),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      child: ExpenseWidget(expense: expenses[index]),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: expenses.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
