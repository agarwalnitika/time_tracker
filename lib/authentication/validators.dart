abstract class StringValidator {
  bool isValid( String value);
}

class Validates implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}


class EmailAndPasswordValidator {
  final StringValidator emailValidator = Validates();
  final StringValidator passwordValidator = Validates();
  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';
}