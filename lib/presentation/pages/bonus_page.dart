import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    context.read<UserBloc>().add(GetUserEvent(id: user!.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Card Billing
            Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(
                defaultMargin,
              ),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/image_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                                if (state is UserLoaded) {
                                  return Text(
                                    state.user.name,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }
                                return const Text('No Name');
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/logo_airplane.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        return Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(state.user.balance),
                          style: whiteTextStyle.copyWith(
                            fontSize: 26,
                            fontWeight: medium,
                          ),
                        );
                      }
                      return const Text('No Balance');
                    },
                  ),
                ],
              ),
            ),

            /// Title
            Container(
              margin: const EdgeInsets.only(
                top: 80,
              ),
              child: Text(
                'Big Bonus 🎉',
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
            ),

            /// Subtitle
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'We give you early credit so that\nyou can buy a flight ticket',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            /// Start Button
            CustomButton(
              title: 'Start Fly Now',
              width: 220,
              margin: const EdgeInsets.only(
                top: 50,
              ),
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
