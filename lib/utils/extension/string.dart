extension StringExtension on String {
  String capitalizeFirst() => "${this[0].toUpperCase()}${substring(1)}";
}
