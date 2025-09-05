import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import '../const/locals.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static List<LocalizationsDelegate<dynamic>> localizationsDelegates = const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      appLogo: 'Fatorty',
      appTitle: 'Expenses',
      expensesChart: 'Expenses Chart',
      addExpense: 'Add Expense',
      validationError: 'Please make sure that you fill all fields!',
      titleHint: 'Title',
      amountHint: 'Amount',
      categoryHint: 'Select Category',
      dateHint: 'Select Date',
      save: 'Save',
      cancel: 'Cancel',
      delete: 'Delete',
      noExpenses: 'No expenses yet.',
      food: 'Food',
      travel: 'Travel',
      entertainment: 'Entertainment',
      utilities: 'Utilities',
      others: 'Others',
      confirm: 'Confirm',
      confirmClearExpenses: 'Are you sure you want to clear all expenses?',
    },
    'ar': {
      appLogo: 'فاتورتي',
      appTitle: 'المصروفات',
      expensesChart: 'مخطط المصروفات',
      addExpense: 'إضافة مصاريف',
      validationError: 'يرجى التأكد من ملء جميع الحقول!',
      titleHint: 'العنوان',
      amountHint: 'المبلغ',
      categoryHint: 'اختر الفئة',
      dateHint: 'اختر التاريخ',
      save: 'حفظ',
      cancel: 'إلغاء',
      delete: 'حذف',
      noExpenses: 'لا توجد مصروفات بعد.',
      food: 'طعام',
      travel: 'سفر',
      entertainment: 'ترفيه',
      utilities: 'فواتير',
      others: 'أخرى',
      confirm: 'تأكيد',
      confirmClearExpenses: 'هل أنت متأكد أنك تريد مسح جميع المصروفات؟',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}