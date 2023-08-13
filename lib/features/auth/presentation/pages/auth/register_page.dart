import 'package:cyclego/core/constants/constatns.dart';
import 'package:cyclego/features/auth/domain/entities/auth_user_entity.dart';
import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:cyclego/features/cycle/presentation/pages/home/home_page.dart';
import 'package:cyclego/features/auth/presentation/widgets/common_button.dart';
import 'package:cyclego/features/auth/presentation/widgets/common_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cyclego/features/auth/presentation/widgets/app_bar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isSignedIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialsCubit, CredentialsState>(
      listener: (context, credentialsState) {
        if (credentialsState is CredentialsSuccess) {
          BlocProvider.of<AuthCubit>(context).loggedIn();
        }
        if (credentialsState is CredentialsFaliure) {
          toast("Invalid Email or Password");
        }
      },
      builder: (context, credentialsState) {
        if (credentialsState is CredentialsSuccess) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is Authenticated) {
                return HomePage(uid: authState.uid);
              } else {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(200.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: const AppBarContent(
                          title: 'REGISTER NEW ACCOUNT',
                        ),
                      ),
                    ),
                  ),
                  body: _bodyWidget(),
                );
              }
            },
          );
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        30,
                      ),
                      bottomRight: Radius.circular(30)),
                ),
                child: const AppBarContent(
                  title: 'REGISTER NEW ACCOUNT',
                ),
              ),
            ),
          ),
          body: _bodyWidget(),
        );
      },
    );
  }

  _bodyWidget() {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              controller: _firstNameController,
              hintText: 'First Name',
              obscureText: false,
              label: 'First Name',
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              controller: _lastNameController,
              hintText: 'Last Name',
              obscureText: false,
              label: 'Last Name',
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              controller: _emailController,
              hintText: 'Email',
              obscureText: false,
              label: 'Email',
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              suffixicon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.blue,
                ),
              ),
              controller: _passwordController,
              hintText: 'Password',
              obscureText: !_isPasswordVisible,
              label: 'Password',
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              suffixicon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
                child: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blue,
                ),
              ),
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: !_isConfirmPasswordVisible,
              label: 'Confirm Password',
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              _isSignedIn == true
                  ? const Column(
                      children: [
                        Text(
                          "Please Wait",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      ],
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonButton(
                      onPressed: () {
                        _signUpUser();
                      },
                      text: "REGISTER",
                      color: Colors.blue,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Already have a Account? ',
                              style: TextStyle(fontSize: 17)),
                          TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, 'login-in-page');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _signUpUser() {
    final String password = _passwordController.text;
    final String email = _emailController.text;
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      toast("Password do not match");
      return;
    } else {
      setState(() {
        _isSignedIn = true;
      });
      BlocProvider.of<CredentialsCubit>(context)
          .signUpUser(
              user: AuthUserEntity(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            photoURL: '',
          ))
          .then((value) => _clear());
    }
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _firstNameController.clear();
      _lastNameController.clear();
      _confirmPasswordController.clear();
      _isSignedIn = false;
    });
  }
}
