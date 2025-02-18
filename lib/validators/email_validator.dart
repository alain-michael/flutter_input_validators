class EmailValidator {
  static String? validate(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }
}
