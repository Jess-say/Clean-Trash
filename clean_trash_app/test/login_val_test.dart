import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Empty email returns error string', () {

    final result = EmailFieldValidator.validate('');
    expect(result, 'Please input email can\'t be empty');
  });

  test('Invalid! Email returns error string for missing @', () {

    final result = EmailFieldValidator.validate('email.');
    expect(result, 'The e-mail is invalid!');
  });

  test('Invalid! Email returns error string for missing .', () {

    final result = EmailFieldValidator.validate('email@');
    expect(result, 'The e-mail is invalid!');
  });

  test('Invalid! Email returns error string for missing both @ and .', () {

    final result = EmailFieldValidator.validate('email');
    expect(result, 'The e-mail is invalid!');
  });

  test('Non-empty email returns null', () {

    final result = EmailFieldValidator.validate('email@gmail.com');
    expect(result, null);
  });

  test('Empty password returns error string', () {

    final result = PasswordFieldValidator.validate('');
    expect(result, 'Please input password can\'t be empty');
  });

  test('Non-empty password returns null', () {

    final result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}