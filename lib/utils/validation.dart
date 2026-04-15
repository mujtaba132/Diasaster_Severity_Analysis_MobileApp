class AppValidations {

 static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

 static  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }
    RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');

    if (!passwordRegExp.hasMatch(value.trim())) {
      return "Length of 6 with apla, num, sp.character";
    }
    return null;
  }


   static  String? validatePhoneNo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Feild is required";
    }
    RegExp phoneRegExp = RegExp(r'^(?:\+92|0)3[0-9]{9}$');

    if (!phoneRegExp.hasMatch(value.trim())) {
      return "Number is not valid";
    }
    return null;
  }
   
  

  static String? validateRequiredFeild(String? value)
  { 
    if (value == null || value.trim().isEmpty) {
      return "Feild is required";
    } 
    return null;
  }
  
}
