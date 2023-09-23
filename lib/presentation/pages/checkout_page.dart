// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:airplane_booking_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/transaction_model.dart';
import 'package:airplane_booking_app/presentation/widgets/booking_details_item.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            /// Rute
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 75,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_checkout.png',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CGK',
                            style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            transaction.destination.city,
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'KNTL',
                            style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Kontol',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Book details
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Destination Tile
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              transaction.destination.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.destination.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              transaction.destination.city,
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 2),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icon_star.png',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            transaction.destination.rating.toString(),
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // TODO : BOOKING DETAILS TEXT
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Booking Details',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),

                  // TODO : BOOKING DETAILS
                  BookingDetailsItem(
                    title: 'Traveler',
                    valueText: '${transaction.amountTraveler} person',
                    valueColor: kBlackColor,
                  ),
                  BookingDetailsItem(
                    title: 'Seat',
                    valueText: transaction.selectedSeats,
                    valueColor: kBlackColor,
                  ),
                  BookingDetailsItem(
                    title: 'Insurance',
                    valueText: transaction.insurance ? 'YES' : 'NO',
                    valueColor: transaction.insurance ? kGreenColor : kRedColor,
                  ),
                  BookingDetailsItem(
                    title: 'Refundable',
                    valueText: transaction.refundable ? 'YES' : 'NO',
                    valueColor:
                        transaction.refundable ? kGreenColor : kRedColor,
                  ),
                  BookingDetailsItem(
                    title: 'VAT',
                    valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                    valueColor: kBlackColor,
                  ),
                  BookingDetailsItem(
                    title: 'Price',
                    valueText: NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(transaction.price),
                    valueColor: kBlackColor,
                  ),
                  BookingDetailsItem(
                    title: 'Grand Total',
                    valueText: NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(transaction.grandTotal),
                    valueColor: kPrimaryColor,
                  ),
                ],
              ),
            ),

            /// Payments details
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoaded) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kWhiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Detail',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 70,
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/image_card.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        margin: const EdgeInsets.only(right: 6),
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logo_airplane.png'),
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
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0,
                                      ).format(state.user.balance),
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: medium,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Current Balance',
                                      style: greyTextStyle.copyWith(
                                        fontWeight: light,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),

            /// Button BLOC
            BlocConsumer<TransactionBloc, TransactionState>(
              listener: (context, state) {
                if (state is TransactionLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Transaksi Success'),
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                  context.go('/success');
                }

                if (state is TransactionError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  title: 'Pay Now',
                  onPressed: () {
                    context
                        .read<TransactionBloc>()
                        .add(CreateTransactionEvent(model: transaction));
                  },
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                );
              },
            ),

            /// Button CUBIT
            // BlocConsumer<TransaksiCubit, TransaksiState>(
            //   listener: (context, state) {
            //     if (state is TransaksiLoaded) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Transaksi Success'),
            //           backgroundColor: Colors.blueAccent,
            //         ),
            //       );
            //       context.go('/success');
            //     }

            //     if (state is TransaksiError) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(state.error),
            //           backgroundColor: Colors.redAccent,
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is TransaksiLoading) {
            //       return Container(
            //         alignment: Alignment.center,
            //         margin: const EdgeInsets.only(top: 50),
            //         child: const CircularProgressIndicator(),
            //       );
            //     }
            //     return CustomButton(
            //       title: 'Pay Now',
            //       onPressed: () {
            //         context.read<TransaksiCubit>().createTransaksi(transaction);
            //       },
            //       margin: const EdgeInsets.only(
            //         top: 50,
            //       ),
            //     );
            //   },
            // ),

            /// Tac button
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: Text(
                'Terms and Conditions',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
