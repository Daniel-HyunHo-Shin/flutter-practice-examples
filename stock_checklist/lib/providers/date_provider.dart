import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currentDateProvider = Provider(
  (_) => DateFormat('M월 d일').format(
    DateTime.now(),
  ),
);
