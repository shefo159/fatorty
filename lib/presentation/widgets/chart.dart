import 'package:fatorty/data/models/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../business/expense_controller.dart';
import '../../data/const/locals.dart';
import '../../data/localization/local.dart';

class ExpensesChart extends StatefulWidget {
  const ExpensesChart({super.key});

  @override
  State<ExpensesChart> createState() => _ExpensesChartState();
}

class _ExpensesChartState extends State<ExpensesChart> {
  ExpenseController controller = ExpenseController();

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    var loc = AppLocalizations(currentLocale);
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.translate(expensesChart),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: StreamBuilder(
                stream: controller.streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text(loc.translate(noExpenses)));
                  }

                  final expenses = snapshot.data!;

                  return BarChart(
                    BarChartData(
                      barGroups: [
                        barGroupData(
                          x: 0,
                          y: controller.getTotalByCategory(
                            expensesList: expenses,
                            category: Category.food,
                          ),
                        ),
                        barGroupData(
                          x: 1,
                          y: controller.getTotalByCategory(
                            expensesList: expenses,
                            category: Category.travel,
                          ),
                        ),
                        barGroupData(
                          x: 2,
                          y: controller.getTotalByCategory(
                            expensesList: expenses,
                            category: Category.entertainment,
                          ),
                        ),
                        barGroupData(
                          x: 3,
                          y: controller.getTotalByCategory(
                            expensesList: expenses,
                            category: Category.utilities,
                          ),
                        ),
                        barGroupData(
                          x: 4,
                          y: controller.getTotalByCategory(
                            expensesList: expenses,
                            category: Category.others,
                          ),
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              // Map bar index to label
                              final icons = [
                                Icons.fastfood,
                                Icons.flight_outlined,
                                Icons.movie,
                                Icons.lightbulb,
                                Icons.more_horiz,
                              ];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  icons[value.toInt()],
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      barTouchData: BarTouchData(enabled: false),
                      alignment: BarChartAlignment.spaceAround,
                      //Todo set dynamic maxY
                      maxY: ExpenseController().getTotalExpense(
                        expensesList: expenses,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  barGroupData({required int x, required double y}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Theme.of(context).primaryColor,
          width: 40,
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ],
    );
  }
}
