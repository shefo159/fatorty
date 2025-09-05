import '../const/db_text.dart';

class Expense {
  late final int? id;
  late final String title;
  late final Category category;
  late final double amount;
  late final DateTime date;

  Expense({
    this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });

   Expense.fromMap(Map<String, dynamic> map){
    id = map['id'];
    title = map['title'];
    category = Category.values.firstWhere((e) => e.toString() == 'Category.' + map['category']);
    amount = map['amount'];
    date = DateTime.parse(map['date']);
  }
  Map<String, dynamic> toMap() {
    return {
      columnTitle: title,
      columnCategory: category.toString().split('.').last,
      columnAmount: amount,
      columnDate: date.toIso8601String(),
    };
  }
}


enum Category { food, travel, entertainment, utilities, others }
