import 'dart:async';

import 'package:fatorty/data/models/expense.dart';
import 'package:fatorty/data/repo_imp/db.dart';
import 'package:flutter/material.dart';

class ExpenseController {
  // Singleton pattern implementation
  static final ExpenseController _instance = ExpenseController._();

  ExpenseController._();

  factory ExpenseController() => _instance;

  List<Expense> expenses = [];
  StreamController<List<Expense>> streamController =
      StreamController<List<Expense>>.broadcast();

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Category? selectedCategory;
  DateTime selectedDate = DateTime.now();

  void getAllExpenses() async {
    try {
      DB().getAllExpenses().then((list){
        streamController.sink.add(sortExpensesByDate(expensesList: List<Expense>.from(list)));
      });
    } catch (e) {
      streamController.sink.addError(e);
    }
  }

  void removeExpense(int id) {
    DB().removeExpense(id).then((_) {
      getAllExpenses();
    });
  }
  void clearAllExpenses() {
    DB().clearExpenses().then((_) {
      getAllExpenses();
    });
  }

  void clearInputs() {
    titleController.clear();
    amountController.clear();
    selectedCategory = null;
    selectedDate = DateTime.now();
  }
  
  List<Expense> sortExpensesByDate({required List<Expense> expensesList}) {
    expensesList.sort((a, b) => b.date.compareTo(a.date));
    return expensesList;
  }

  void onSave() async {
    // Logic to save the expense
    final Expense expense = Expense(
      title: titleController.text,
      category: selectedCategory!,
      amount: double.parse(amountController.text),
      date: selectedDate,
    );
    // insert into db
    await DB().insert(expense: expense);
    getAllExpenses();
    //clear inputs
    clearInputs();
  }

  List<Map<String, dynamic>> getExpenses() {
    // Logic to retrieve all expenses
    return [];
  }

  String getFormattedDate(DateTime date) {
    return '${date.month}-${date.day}-${date.year}';
  }

  bool validateInputs() {
    return titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        selectedCategory != null;
  }

  IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood;
      case Category.travel:
        return Icons.flight;
      case Category.entertainment:
        return Icons.movie;
      case Category.utilities:
        return Icons.lightbulb;
      case Category.others:
        return Icons.more_horiz;
    }
  }

  double getTotalExpense({required List<Expense> expensesList}) {
    return expensesList.fold(0, (sum, item) => sum + item.amount);
  }

  double getTotalByCategory({
    required List<Expense> expensesList,
    required Category category,
  }) {
    return expensesList
        .where((expense) => expense.category == category)
        .fold(0, (sum, item) => sum + item.amount);
  }
}
