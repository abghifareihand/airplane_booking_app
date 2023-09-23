import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/pages/home_page.dart';
import 'package:airplane_booking_app/presentation/pages/settings_page.dart';
import 'package:airplane_booking_app/presentation/pages/transaction_page.dart';
import 'package:airplane_booking_app/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  List pages = [
    const HomePage(),
    const TransactionPage(),
    const WalletPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: pages[selectedIndex],
    );
  }

  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: GNav(
          backgroundColor: Colors.white,
          color: kGreyColor,
          activeColor: kPrimaryColor,
          tabBackgroundColor: kPrimaryColor.withOpacity(0.15),
          gap: 10,
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            if (selectedIndex != index) {
              setState(() {
                selectedIndex = index;
              });
            }
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home_rounded,
              text: 'Home',
            ),
            GButton(
              icon: Icons.wallet_giftcard,
              text: 'Transaction',
            ),
            GButton(
              icon: Icons.wallet,
              text: 'News',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}