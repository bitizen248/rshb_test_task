import 'package:intl/intl.dart';

class Strings {
  static String ratingPlural(int count) =>
      Intl.plural(count, one: 'оценка', two: 'оценки', few: "оценки", many: 'оценок', other: 'оценок', locale: 'ru');
}
