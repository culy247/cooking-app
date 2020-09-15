extension StringSplit on String {
  List<String> toList(String separator) {
    if (this == null || isEmpty) {
      return [];
    }
    return split(separator);
  }
}
