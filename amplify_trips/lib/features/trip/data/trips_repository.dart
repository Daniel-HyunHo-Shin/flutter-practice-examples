import 'package:amplify_trips/features/trip/services/trips_datastore_service.dart';

import '../../../models/Trip.dart';

class TripsRepository {
  final TripsAPIService tripsAPIService;
  TripsRepository(this.tripsAPIService);

  Future addTrip(Trip trip) async {
    await tripsAPIService.addTrip(trip);
  }

  Future deleteTrip(Trip trip) async {
    await tripsAPIService.deleteTrip(trip);
  }

  Future updateTrip(Trip updatedTrip) async {
    await tripsAPIService.updateTrip(updatedTrip);
  }

  Future<Trip> getTrip(String tripId) async {
    return await tripsAPIService.getTrip(tripId);
  }
}
