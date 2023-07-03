import 'package:amplify_trips/common/navigation/router/routes.dart';
import 'package:amplify_trips/features/trip/ui/trips/trips_list_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: AppRoute.home.name,
    builder: (context, state) => const TripsListPage(),
  )
]);
