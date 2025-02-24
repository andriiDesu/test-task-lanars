final _emailRegExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]{1,10}@(?!.*--)[a-zA-Z0-9-]{1,10}(?<!-)(?:\.[a-zA-Z0-9-]{2,10})+$");
final _passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,10}$');

class ValidatorUtil {
  ValidatorUtil._();

  static String? validateEmail(String? email, [bool clearState = false]) {
    if(clearState) {
      return null;
    }

    if(email?.isEmpty ?? true) {
      return 'Email is incorrect';
    } else if(!_emailRegExp.hasMatch(email!)) {
      return 'Email is incorrect';
    }

    return null;
  }

  static String? validatePassword(String? password, [bool clearState = false]) {
    if(clearState) {
      return null;
    }

    if(password?.isEmpty ?? true) {
      return 'Password is incorrect';
    } else if(!_passwordRegExp.hasMatch(password!)) {
      return 'Password is incorrect';
    }

    return null;
  }
}