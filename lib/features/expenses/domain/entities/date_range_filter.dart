enum DateRangeFilter {
  today,
  thisWeek,
  thisMonth,
  all;

  String get label {
    switch (this) {
      case DateRangeFilter.today:
        return "Today";
      case DateRangeFilter.thisWeek:
        return "This week";
      case DateRangeFilter.thisMonth:
        return "This Month";
      case DateRangeFilter.all:
        return "All";
    }
  }
}
