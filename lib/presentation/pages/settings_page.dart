import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/bloc/login/login_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/logout/logout_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/register/register_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:airplane_booking_app/presentation/pages/login_page.dart';
import 'package:airplane_booking_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Text(
                            state.user.name,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            state.user.email,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            state.user.hobby,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(state.user.balance),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person_2_rounded,
                  color: kBlackColor,
                ),
                title: Text(
                  'Edit Profile',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kBlackColor,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: kBlackColor,
                ),
                title: Text(
                  'Settings',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kBlackColor,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.support_agent_outlined,
                  color: kBlackColor,
                ),
                title: Text(
                  'Help and Support',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kBlackColor,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: kBlackColor,
                ),
                title: Text(
                  'Privacy Policy',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kBlackColor,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.perm_device_information_outlined,
                  color: kBlackColor,
                ),
                title: Text(
                  'About App',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              BlocConsumer<LogoutBloc, LogoutState>(
                builder: (context, state) {
                  return CustomButton(
                    title: 'Logout',
                    onPressed: () {
                      context.read<LogoutBloc>().add(DoLogoutEvent());
                    },
                  );
                },
                listener: (context, state) {
                  if (state is LogoutError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: kRedColor,
                      ),
                    );
                  }
                  // Tambahkan logika jika Anda ingin melakukan sesuatu setelah logout berhasil
                  if (state is LogoutLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Berhasil Logout'),
                        backgroundColor: kRedColor,
                      ),
                    );
                    context.go('/login');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
