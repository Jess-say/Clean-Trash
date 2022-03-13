import 'package:cleantrash_app/screens/Login/signup_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Empty email returns error string', () {
    final result = ValidEmail.validateEmail('');
    expect(result, 'Please input email can\'t be empty');
  });

  test('Email without @ returns error string', () {
    final result = ValidEmail.validateEmail('testing.');
    expect(result, 'The e-mail is invalid!');
  });

  test('Email without . returns error string', () {
    final result = ValidEmail.validateEmail('testing@');
    expect(result, 'The e-mail is invalid!');
  });

  test('Valid Email returns null', () {

    final result = ValidEmail.validateEmail('testing@gmail.com');
    expect(result, null);
  });


  test('Empty password returns error string', () {

    final result = PasswordValidator.validatePass('');
    expect(result, 'Please input password can\'t be empty');
  });

  test('Invalid! Password is less than 5 characters', () {

    final result = PasswordValidator.validatePass('Hi');
    expect(result, 'Password should be more than 5 characters');
  });

  test('Invalid! Password is 5 characters should be more than 5 characters', () {

    final result = PasswordValidator.validatePass('hello');
    expect(result, 'Password should be more than 5 characters');
  });

  test('Valid! Password is more than 5 characters', () {

    final result = PasswordValidator.validatePass('Hello12345');
    expect(result, null);
  });


}
