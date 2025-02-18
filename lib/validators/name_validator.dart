class NameValidator {
  static String? validate(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    } else if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }
}
