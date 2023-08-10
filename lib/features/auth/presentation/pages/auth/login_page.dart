import 'package:cyclego/core/constants/constatns.dart';
import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:cyclego/features/auth/presentation/pages/home/home_page.dart';
import 'package:cyclego/features/auth/presentation/widgets/app_bar_content.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common_button.dart';
import '../../widgets/common_text_field.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: 'ram@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'password');
  bool _isPasswordVisible = false;
  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                        Navigator.maybePop(context);
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
                          title: 'SIGN IN TO YOUR ACCOUNT',
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
                Navigator.maybePop(context);
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
                  title: 'SIGN IN TO YOUR ACCOUNT',
                ),
              ),
            ),
          ),
          body: _bodyWidget(),
        );
      },
    );
  }

  void _singInUser() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialsCubit>(context)
        .signInUser(
          email: _emailController.text,
          password: _passwordController.text,
        )
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
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
              controller: _emailController,
              hintText: 'example@gmail.com',
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
              hintText: '********',
              obscureText: !_isPasswordVisible,
              label: 'Password',
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              _isSigningIn == true
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
                        _singInUser();
                      },
                      text: "Login",
                      color: Colors.blue,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "Don't have an Account? ",
                              style: TextStyle(fontSize: 17)),
                          TextSpan(
                            text: 'Create Account',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, 'register-page');
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
}
