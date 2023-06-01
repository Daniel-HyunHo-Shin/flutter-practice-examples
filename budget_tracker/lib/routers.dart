import 'package:budget_tracker/screens/home_screen.dart';
import 'package:budget_tracker/screens/manage_budget_entry_screen.dart';
import 'package:go_router/go_router.dart';

import 'models/BudgetEntry.dart';

// GoRouter configuration

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/manage-budget-entry',
      name: 'manage',
      builder: (context, state) => ManageBudgetEntryScreen(
        budgetEntry: state.extra as BudgetEntry?,
      ),
    )
  ],
);
