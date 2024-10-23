import 'package:app_test/componants/custom_button.dart';
import 'package:app_test/componants/snackbar_helper.dart';
import 'package:app_test/config/routes.dart';
import 'package:app_test/providers/auth_controller_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<FocusNode> _focusNodes = List.generate(2, (index) => FocusNode());

  void _submitLogin({required WidgetRef ref}) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      for (var node in _focusNodes) {
        node.unfocus();
      }
      ref.read(loginController.notifier).login(
            phone: _formKey.currentState!.value['phone'],
            password: _formKey.currentState!.value['password'],
          );
    }
  }

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
                  key: Key('loginTitle'),
                  'Welcome to the Flutter app!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gap(32.h),
                FormBuilderTextField(
                  key: Key('phoneField'),
                  autofocus: false,
                  focusNode: _focusNodes[0],
                  name: 'phone',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
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
                  key: Key('passwordField'),
                  autofocus: false,
                  focusNode: _focusNodes[1],
                  name: 'password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: FormBuilderValidators.required(),
                ),
                Gap(16.h),
                const SizedBox(height: 16.0),
                Consumer(builder: (context, ref, _) {
                  final loginState = ref.watch(loginController);
                  return loginState.when(
                    data: (user) {
                      ref.invalidate(loginController);
                      return CustomButton(
                        text: 'Login',
                        onPressed: () => _submitLogin(ref: ref),
                      );
                    },
                    error: (error, stackTrace) {
                      SnackbarHelper.showSnackbar(
                        context: context,
                        message: error.toString(),
                        isSuccess: false,
                      );
                      ref.invalidate(loginController);
                      return CustomButton(
                        text: 'Login',
                        onPressed: () => _submitLogin(ref: ref),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                  );
                }),
                Gap(16.h),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.thirdScreen),
                      child: const Text('Sign up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
