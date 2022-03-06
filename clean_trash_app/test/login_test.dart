import 'package:flutter/material.dart';
import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
testWidgets('Valid Email and Password Login', (WidgetTester tester) async {
  LoginPage login = new LoginPage();
  var app = new MediaQuery(data: new MediaQueryData(), child: new MaterialApp(home: login));
  await tester.pumpWidget(app);

  Finder email = find.byKey(Key('email'));
  Finder pwd = find.byKey(Key('password'));

  await tester.enterText(email, "testing@gmail.com");
  await tester.enterText(pwd, "123456testing");
  await tester.pump();

  Finder formWidgetFinder = find.byType(Form);
  Form formWidget = tester.widget(formWidgetFinder) as Form;
  GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;

  expect(formKey.currentState?.validate(), isTrue);
});

}
//Errors: The following ProviderNotFoundException was thrown building LoginPage(dirty, state:
// _LoginPageState#8fed5):
// Error: Could not find the correct Provider<Auth> above this LoginPage Widget

//And The following StateError was thrown running a test:
// Bad state: No element