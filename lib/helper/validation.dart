class Validation {
  static String validatePass(String pass)
  {
    if(pass == null)
    {
      return "Password invalid";
    }

    if(pass.length < 6)
    {
      return "Password require 6 letter in minimum";
    }

    return null;
  }

  static String ValidateEmail(String email)
  {
    if(email == null)
    {
      return "Invalid email";
    }

    var isValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(!isValid)
    {
      return "Email invalid";
    }
    return null;
  }
}