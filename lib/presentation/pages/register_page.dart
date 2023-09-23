import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/auth_model.dart';
import 'package:airplane_booking_app/presentation/bloc/register/register_bloc.dart';
import 'package:airplane_booking_app/presentation/pages/login_page.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    hobbyController.dispose();
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
                'Register us and get\nyour next journey',
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
                  /// Fullname
                  CustomTextFormField(
                    title: 'Full Name',
                    hintText: 'Your Full Name',
                    controller: nameController,
                  ),

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

                  /// Hobby
                  CustomTextFormField(
                    title: 'Hobby',
                    hintText: 'Your Hobby',
                    controller: hobbyController,
                  ),

                  /// Button Register
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                      if (state is RegisterLoaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Register Success'),
                            backgroundColor: Colors.blueAccent,
                          ),
                        );
                        context.go('/login');
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButton(
                        title: 'Register',
                        onPressed: () {
                          final register = AuthModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            hobby: hobbyController.text,
                          );
                          context
                              .read<RegisterBloc>()
                              .add(SendRegisterEvent(model: register));
                        },
                      );
                    },
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 73,
                      ),
                      child: Text(
                        'Have an account? Login',
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
