import 'package:flutter/material.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:tracker_app/widgets/new_expenses.dart';
import 'package:tracker_app/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema', 
      amount: 15.59, 
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpenses(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expenses deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
              expenses: _registeredExpenses, 
              onRemoveExpense: _removeExpenses,
            );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _openAddExpensesOverlay,
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          // toolbar with the add button
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent
          )
        ]
      ) 
      : Row(
        children: [
          // toolbar with the add button
          Expanded(
            child: Chart(expenses: _registeredExpenses)
          ),
          Expanded(
            child: mainContent
          )
        ]
      )
    );
  }
}