class PhoneValidator {
  static String? validate(String phone) {
    if (phone.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
