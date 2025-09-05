import 'package:fatorty/data/models/expense.dart';

abstract class IDatabaseService {
  //create database connection (if db not exists create it)
  //init db tables
  //close db connection
  Future<void> init();
  Future<void> insert({required Expense expense});
  Future<List<Expense>> getAllExpenses();
  Future<void> removeExpense(int id);
  Future<void> clearExpenses();
  Future<void> close();
}