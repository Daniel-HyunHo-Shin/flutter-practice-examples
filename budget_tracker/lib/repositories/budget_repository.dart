// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ModelProvider.dart';

final budgetRepositoryProvider = Provider(
  (ref) => BudgetRepository(
    amplifyAPI: AmplifyAPI(modelProvider: ModelProvider.instance),
  ),
);

class BudgetRepository {
  final AmplifyAPI amplifyAPI;
  BudgetRepository({
    required this.amplifyAPI,
  });

  Future<List?> getBudgetEntries() async {
    try {
      final request = ModelQueries.list(BudgetEntry.classType);
      final response = await amplifyAPI.query(request: request).response;
      final todos = response.data?.items;
      final budgetEntries = todos!.whereType<BudgetEntry>().toList();
      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
      }
      return budgetEntries;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
    return null;
  }

  /// Method to delete the Entry
  Future<void> deleteBudgetEntry(BudgetEntry budgetEntry) async {
    final request = ModelMutations.delete<BudgetEntry>(budgetEntry);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint('Delete response: $response');
    await getBudgetEntries();
  }
}
