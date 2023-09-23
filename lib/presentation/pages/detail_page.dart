import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/destination_model.dart';
import 'package:airplane_booking_app/presentation/pages/choose_seat_page.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:airplane_booking_app/presentation/widgets/interest_item_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              /// Image detail
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      destination.imageUrl,
                    ),
                  ),
                ),
              ),

              /// Shadow image
              Container(
                width: double.infinity,
                height: 214,
                margin: const EdgeInsets.only(
                  top: 236,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kWhiteColor.withOpacity(0),
                      Colors.black.withOpacity(0.95),
                    ],
                  ),
                ),
              ),

              // Content
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  children: [
                    /// Emblem
                    Container(
                      width: 108,
                      height: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_emblem.png'),
                        ),
                      ),
                    ),

                    /// Title
                    Container(
                      margin: const EdgeInsets.only(
                        top: 256,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.name,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  destination.city,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: light,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                destination.rating.toString(),
                                style: whiteTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Desc
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// About
                          Text(
                            'About',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            destination.desc,
                            style: blackTextStyle.copyWith(
                              height: 2,
                            ),
                          ),

                          /// Photo
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Photos',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 70,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: destination.photoList.map((photo) {
                                return Container(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        photo,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          /// Interest
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Interests',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          GridView.count(
                            childAspectRatio: (deviceWidth(context) / 70),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: destination.interestList.map((interest) {
                              return Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    margin: const EdgeInsets.only(right: 6),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage('assets/icon_check.png'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      interest,
                                      style: blackTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    /// Price and Button Book
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Row(
                        children: [
                          /// Price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                  ).format(destination.price),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'per orang',
                                  style: greyTextStyle.copyWith(
                                    fontWeight: light,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Button
                          CustomButton(
                            width: 170,
                            title: 'Book Now',
                            onPressed: () {
                              // context.push('/seat-page');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseSeatPage(
                                    destination: destination,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Button Back
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite),
                        color: kPrimaryColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
