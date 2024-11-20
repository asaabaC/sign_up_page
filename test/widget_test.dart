import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_up_page/main.dart';  // Import the correct file where SignUpApp is defined.

void main() {
  testWidgets('Sign Up Page form validation test', (WidgetTester tester) async {
    // Build the SignUpApp widget and trigger a frame.
    await tester.pumpWidget(const SignUpApp());

    // Verify that the email text field, password field, and confirm password field are present.
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.text('Sign Up'), findsOneWidget);

    // Verify the presence of the Email field label.
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Enter text into the text fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');

    // Tap the Sign Up button and trigger a frame.
    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    // Verify that the form is valid and the sign-up button works as expected.
    // (In this case, the test would check for some UI feedback, like a SnackBar or any other response).
    expect(find.text('Signing up with email'), findsOneWidget);
  });
}
