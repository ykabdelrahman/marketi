String? validatEmptyField(String? value, {required String fieldName}) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your email address.";
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  // Check if contains only digits
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Phone number must contain only digits';
  }
  if (value.length < 8 || value.length > 15) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required.';
  }
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~-]).{8,}$';

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return '''
Password must be at least 8 characters,
include an uppercase letter, number and symbol.
      ''';
  }
  return null;
}

String? validateConfirmPassword(String? value, {required String password}) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateOtpDigit(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required';
  }
  if (!RegExp(r'^[0-9]$').hasMatch(value)) {
    return 'Invalid';
  }
  return null;
}
