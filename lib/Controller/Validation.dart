class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
  static String?validatePostalCode(String? value){
    if(value==null || value.isEmpty){
      return "Please enter a postalCode";
    }
    if(value.length<6){
      return 'PostalCode must be at least 6 characters long';
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
  static String?validateFullname(String? value){
    if(value==null || value.isEmpty){
      return "Please enter a FullName";
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
  static String?ValidateAddress(String? value){
    if(value==null || value.isEmpty){
      return "Please enter Address";
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
  static String?validatePhonenum(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Phone Number';
    }
    if (value.length < 10) {
      return 'Phone Number must be at least 10 characters long';
    }
    if(value.isNotEmpty){
      return null;
    }
    return null;
  }
}
