import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/cubit/page_cubit.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuccessChekoutPage extends StatelessWidget {
  const SuccessChekoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_success.png',
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              margin: const EdgeInsets.only(top: 50),
              width: 220,
              title: 'My Bookings',
              onPressed: () {
                context.go('/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}
