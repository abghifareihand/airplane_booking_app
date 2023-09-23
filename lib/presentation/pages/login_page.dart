import 'dart:math';

import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/auth_model.dart';
import 'package:airplane_booking_app/presentation/bloc/login/login_bloc.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            /// Text Join Us
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Login with your\nexisting account',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
            ),

            /// Card Form
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              child: Column(
                children: [
                  /// Email
                  CustomTextFormField(
                    title: 'Email Address',
                    hintText: 'Your Email Address',
                    controller: emailController,
                  ),

                  /// Password
                  CustomTextFormField(
                    title: 'Password',
                    hintText: 'Your Password',
                    obscureText: true,
                    controller: passwordController,
                  ),

                  /// Button Login
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                      if (state is LoginLoaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Success'),
                            backgroundColor: Colors.blueAccent,
                          ),
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        print('USER ID : ${state.userModel.id}');
                        print('USER UID : ${user!.uid}');
                        context.go('/bonus');
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CustomButton(
                          title: 'Loading...',
                          onPressed: () {},
                        );
                      }
                      return CustomButton(
                        title: 'Login',
                        onPressed: () {
                          final login = AuthModel(
                            name: '',
                            email: emailController.text,
                            password: passwordController.text,
                            hobby: '',
                          );
                          context
                              .read<LoginBloc>()
                              .add(SendLoginEvent(model: login));
                        },
                      );
                    },
                  ),

                  GestureDetector(
                    onTap: () {
                      context.go('/register');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 73,
                      ),
                      child: Text(
                        'Don\'t have an account? Register',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
