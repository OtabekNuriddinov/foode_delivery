class Validation{

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your Email!";
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if(!emailRegex.hasMatch(value)){
      return "Please enter a valid email address (e.g., example@gmail.com)";
    }
    return null;
  }
  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your Password!";
    }
    if(value.length < 6){
      return "Password must be at least 6 characters long";
    }
    return null;
  }

 static String? fullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Full Name!";
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Username!";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your phone number.";
    }
    final phoneRegex = RegExp(r'^\+?[1-9]\d{8,14}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return "Enter a valid phone number (e.g. +998901234567)";
    }

    return null;
  }


  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Username!";
    }
    if(value.length <=2){
      return "Address must be at least 3 characters long.";
    }
    return null;
  }
}