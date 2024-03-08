import 'package:formz/formz.dart'; // formz is a package that helps you to handle forms and validations in a reactive way

enum UsernameValidationError {empty} 

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure(''); 
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}