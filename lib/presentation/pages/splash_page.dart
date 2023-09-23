import 'dart:async';

import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        context.go('/get-started');
      } else {
        
        context.go('/main');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_airplane.png'),
                ),
              ),
            ),
            Text(
              'AIRPLANE',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
