// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:budget_tracker/repositories/budget_repository.dart';

import '../models/BudgetEntry.dart';

final budgetControllerProvider = Provider((ref) {
  final budgetRepository = ref.watch(budgetRepositoryProvider);
  return BudgetController(budgetRepository: budgetRepository, ref: ref);
});

class BudgetController {
  final BudgetRepository budgetRepository;
  final ProviderRef ref;

  BudgetController({
    required this.budgetRepository,
    required this.ref,
  });

  Future<void> refreshBudgetEntries() {
    return budgetRepository.getBudgetEntries();
  }

  double _calculateTotalBudget(List<BudgetEntry?> items) {
    var totalAmount = 0.0;
    for (final item in items) {
      totalAmount += item?.amount ?? 0;
    }
    return totalAmount;
  }
}
