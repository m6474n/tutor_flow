extension StringHelpers on String {
  /// Converts text into snake_case
  /// Examples:
  /// "Collar Size" -> "collar_size"
  /// "Chest (Inches)" -> "chest_inches"
  /// "sleeveLength" -> "sleeve_length"
  /// "  Waist  " -> "waist"
  String toSnakeCase() {
    String value = trim();

    if (value.isEmpty) return "";

    // Replace camelCase → snake_case
    value = value.replaceAllMapped(
      RegExp(r'([a-z0-9])([A-Z])'),
      (match) => '${match.group(1)}_${match.group(2)}',
    );

    // Remove special chars but keep spaces
    value = value.replaceAll(RegExp(r'[^A-Za-z0-9 ]'), '');

    return value
        .trim()
        .split(RegExp(r'\s+'))
        .map((w) => w.toLowerCase())
        .join('_');
  }

  /// Converts text into Title Case
  /// Examples:
  /// "collar_size" -> "Collar Size"
  /// "first name" -> "First Name"
  /// "customer_id" -> "Customer Id"
  String toTitleCase() {
    String value = trim();
    if (value.isEmpty) return "";

    // Convert snake_case → normal words
    value = value.replaceAll("_", " ");

    return value
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .map((word) =>
            word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(" ");
  }
}
