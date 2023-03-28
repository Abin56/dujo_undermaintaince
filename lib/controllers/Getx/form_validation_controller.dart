class FormValidation {
  //email validation
  bool emailValidation(String email) {
    if (email.isEmpty) {
      return false;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }


  //password validation

  
}
