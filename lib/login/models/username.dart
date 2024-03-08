import 'package:formz/formz.dart'; // formz is a package that helps you to handle forms and validations in a reactive way

enum UsernameValidationError {empty} // define the possible errors that can occur in the input, in this case, the input can't be empty

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure(''); // pure constructor: the input has not been modified by the user
  const Username.dirty([super.value = '']) : super.dirty(); // dirty constructor: creates an instance that holds a value modified by the user

  // The validator method is used to define custom validation logic for the input
  // In this case, it checks if the input is empty and returns the corresponding error
  // Other errors can be defined here, for example, if the input is too short or too long
  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}