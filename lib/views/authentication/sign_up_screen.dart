import 'package:app_test/componants/custom_button.dart';
import 'package:app_test/models/request/user.dart';
import 'package:app_test/providers/auth_controller_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<FocusNode> _focusNodes = List.generate(3, (_) => FocusNode());

  @override
  void dispose() {
    super.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  key: const Key('signUpTitle'),
                  'Welcome to the Flutter app!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gap(32.h),
                FormBuilderTextField(
                  key: Key('signUpNameField'),
                  focusNode: _focusNodes[0],
                  name: 'name',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: FormBuilderValidators.required(),
                ),
                Gap(16.h),
                FormBuilderTextField(
                  key: const Key('signUpPhoneField'),
                  focusNode: _focusNodes[1],
                  name: 'phone',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.phoneNumber(),
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                Gap(16.h),
                FormBuilderTextField(
                  key: const Key('signUpPasswordField'),
                  focusNode: _focusNodes[2],
                  name: 'password',
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                Gap(32.h),
                Consumer(builder: (context, ref, _) {
                  final signUpState = ref.watch(registerController);
                  return signUpState.when(
                    data: (data) => CustomButton(
                      key: const Key('signUpButton'),
                      text: 'Sign Up',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    error: (error, stackTrace) => ErrorDisplay(
                      errorMessage: error.toString(),
                      onRetry: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ref.read(registerController.notifier).register(
                              user: User.fromMap(_formKey.currentState!.value));
                        }
                      },
                    ),
                    loading: () => const CircularProgressIndicator(),
                  );
                }),
                Gap(16.h),
                Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        key: const Key('signUpLoginButton'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Login'),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
