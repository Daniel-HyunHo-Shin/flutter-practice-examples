import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/Trip.dart';

final tripsAPIServiceProvider = Provider((ref) {
  final service = TripsAPIService();
  return service;
});

class TripsAPIService {
  TripsAPIService();

  Future<void> addTrip(Trip trip) async {
    try {
      // Generate a request to create a new trip
      final request = ModelMutations.create(trip);
      // Send a GraphQl mutate request to the API and return the response GraphQLResponse
      final response = await Amplify.API.mutate(request: request).response;
      // Get the newly created trip from the response data
      final createdTrip = response.data;
      if (createdTrip == null) {
        safePrint('addTrip errors: ${response.errors}');
        return;
      } else {
        safePrint('addTrip success: $createdTrip');
      }
    } on AmplifyException catch (e) {
      safePrint('addTrip failed: $e');
    }
  }

  Future<void> deleteTrip(Trip trip) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.delete(trip),
          )
          .response;
    } on AmplifyException catch (e) {
      safePrint('deleteTrip failed: $e');
    }
  }

  Future<void> updateTrip(Trip updatedTrip) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.update(updatedTrip),
          )
          .response;
    } on AmplifyException catch (e) {
      safePrint('updateTrip failed: $e');
    }
  }

  Future<Trip> getTrip(String tripId) async {
    try {
      final request = ModelQueries.get(
        Trip.classType,
        TripModelIdentifier(id: tripId),
      );
      final response = await Amplify.API.query(request: request).response;
      final trip = response.data!;
      return trip;
    } on AmplifyException catch (e) {
      safePrint('getTrip failed: $e');
      rethrow;
    }
  }

  Future<List<Trip>> getTrips() async {
    try {
      final request = ModelQueries.list(Trip.classType);
      final response = await Amplify.API.query(request: request).response;
      final trips = response.data?.items;

      if (trips == null) {
        safePrint('getTrips errors: ${response.errors}');
        return const [];
      }

      /// Sorting the trips based on their start date
      /// O(n log n) time complexity
      trips.sort(
        (a, b) =>
            a!.startDate.getDateTime().compareTo(b!.startDate.getDateTime()),
      );

      /// Creates a new list of Trip after today
      final tripsAfterToday = trips
          .map((e) => e as Trip)
          .where((element) =>
              element.endDate.getDateTime().isAfter(DateTime.now()))
          .toList();
      return tripsAfterToday;
    } on AmplifyException catch (e) {
      safePrint('getTrips failed: $e');
      return const [];
    }
  }
}
