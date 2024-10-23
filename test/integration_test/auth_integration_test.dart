import 'package:app_test/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Flows', () {
    // Test login flow
    testWidgets('Login flow test', (WidgetTester tester) async {
      // Load the app
      await tester
          .pumpWidget(const MyApp()); // Replace MyApp with your app's widget

      // Find login fields
      final emailField =
          find.byKey(const Key('emailField')); // Use a key for your email field
      final passwordField = find.byKey(
          const Key('passwordField')); // Use a key for your password field
      final loginButton = find
          .byKey(const Key('loginButton')); // Use a key for your login button

      // Enter valid email and password
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');

      // Tap the login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Check if navigated to the third screen
      expect(find.text('Welcome to the Flutter app!'),
          findsOneWidget); // Replace with actual text on the third screen
    });

    // Test sign-up flow
    testWidgets('Sign-up flow test', (WidgetTester tester) async {
      // Load the app
      await tester
          .pumpWidget(const MyApp()); // Replace MyApp with your app's widget

      // Find sign-up button and tap it to navigate to the sign-up screen
      final signUpButton = find.byKey(
          const Key('signUpButton')); // Use a key for your sign-up button
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Find sign-up fields
      final emailField = find
          .byKey(const Key('signUpEmailField')); // Key for sign-up email field
      final passwordField = find.byKey(
          const Key('signUpPasswordField')); // Key for sign-up password field
      final signUpButton1 = find.byKey(
          const Key('signUpSubmitButton')); // Key for sign-up submit button

      // Enter valid email and password
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');

      // Tap the sign-up button
      await tester.tap(signUpButton1);
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Check if navigated to the SignUpSuccessScreen
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('Welcome to the Flutter app!'), findsOneWidget);
    });
  });
}
