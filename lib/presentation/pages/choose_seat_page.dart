// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:airplane_booking_app/data/models/transaction_model.dart';
import 'package:airplane_booking_app/presentation/pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/destination_model.dart';
import 'package:airplane_booking_app/presentation/cubit/seat_cubit.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:airplane_booking_app/presentation/widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                /// Text Select
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    'Select Your\nFavorite Seat',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ),

                /// Seat Status
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 6,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_available.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Available',
                        style: blackTextStyle.copyWith(),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 6,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_selected.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Selected',
                        style: blackTextStyle.copyWith(),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 6,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_unavailable.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Unavailable',
                        style: blackTextStyle.copyWith(),
                      ),
                    ],
                  ),
                ),

                /// Select Seat
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kWhiteColor,
                  ),
                  child: Column(
                    children: [
                      // TODO : SEAT INDICATOR (alfabet)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: Text(
                                'A',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: Text(
                                'B',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: Text(
                                ' ',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: Text(
                                'C',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: Text(
                                'D',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // TODO : SEAT 1
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              isAvailable: false,
                              id: 'A1',
                            ),
                            const SeatItem(
                              isAvailable: false,
                              id: 'B1',
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  '1',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SeatItem(
                              id: 'C1',
                            ),
                            const SeatItem(
                              id: 'D1',
                            ),
                          ],
                        ),
                      ),

                      // TODO : SEAT 2
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: 'A2',
                            ),
                            const SeatItem(
                              id: 'B2',
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  '2',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SeatItem(
                              id: 'C2',
                            ),
                            const SeatItem(
                              id: 'D2',
                            ),
                          ],
                        ),
                      ),

                      // TODO : SEAT 3
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: 'A3',
                            ),
                            const SeatItem(
                              id: 'B3',
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  '3',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SeatItem(
                              id: 'C3',
                            ),
                            const SeatItem(
                              id: 'D3',
                            ),
                          ],
                        ),
                      ),

                      // TODO : SEAT 4
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: 'A4',
                            ),
                            const SeatItem(
                              id: 'B4',
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  '4',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SeatItem(
                              id: 'C4',
                            ),
                            const SeatItem(
                              id: 'D4',
                            ),
                          ],
                        ),
                      ),

                      // TODO : SEAT 5
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SeatItem(
                              id: 'A5',
                            ),
                            const SeatItem(
                              id: 'B5',
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: Text(
                                  '5',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SeatItem(
                              id: 'C5',
                            ),
                            const SeatItem(
                              id: 'D5',
                            ),
                          ],
                        ),
                      ),

                      /// Your seat
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tempat Duduk',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.isNotEmpty
                                  ? state.join(', ')
                                  : 'Belum pilih',
                              style: state.isNotEmpty
                                  ? blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    )
                                  : greyTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                            ),
                          ],
                        ),
                      ),

                      /// Total
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Harga',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.length * destination.price),
                              style: purpleTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Checkou button
                BlocBuilder<SeatCubit, List<String>>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.only(top: 30, bottom: 46),
                      child: ElevatedButton(
                        onPressed: state.isNotEmpty
                            ? () {
                                //context.push('/checkout');
                                int price = destination.price * state.length;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutPage(
                                      transaction: TransactionModel(
                                        destination: destination,
                                        amountTraveler: state.length,
                                        selectedSeats: state.join(', '),
                                        insurance: true,
                                        refundable: false,
                                        vat: 0.45,
                                        price: price,
                                        grandTotal:
                                            price + (price * 0.45).toInt(),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state.isNotEmpty
                              ? kPrimaryColor
                              : Colors.grey, // Atur warna button sesuai kondisi
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                        ),
                        child: Text(
                          'Continue to Checkout',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
