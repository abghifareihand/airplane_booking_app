import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/data/models/destination_model.dart';
import 'package:airplane_booking_app/presentation/bloc/destination/destination_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:airplane_booking_app/presentation/widgets/destination_card.dart';
import 'package:airplane_booking_app/presentation/widgets/destination_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    context.read<UserBloc>().add(GetUserEvent(id: user!.uid));
    context.read<DestinationBloc>().add(GetDestinationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          /// Header
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 30,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLoaded) {
                            return Text(
                              'Hallo, \n${state.user.name}',
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                          return Text(
                            'Loading...',
                            style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Where to fly today?',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image_profile.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Destination Card
          BlocConsumer<DestinationBloc, DestinationState>(
            listener: (context, state) {
              if (state is DestinationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is DestinationLoaded) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  height: 330, // Atur tinggi container
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Atur orientasi horizontal
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        destination: state.destination[index],
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          /// Destination Tile
          BlocConsumer<DestinationBloc, DestinationState>(
            listener: (context, state) {
              if (state is DestinationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is DestinationLoaded) {
                return Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: 100,
                  ),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.destination.length,
                    itemBuilder: (context, index) {
                      return DestinationTile(
                          destination: state.destination[index]);
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
