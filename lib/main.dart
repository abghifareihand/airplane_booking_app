import 'package:airplane_booking_app/data/datasources/remote_datasource/auth_datasource.dart';
import 'package:airplane_booking_app/data/datasources/remote_datasource/destination_datasource.dart';
import 'package:airplane_booking_app/data/datasources/remote_datasource/transaction_datasource.dart';
import 'package:airplane_booking_app/data/datasources/remote_datasource/user_datasource.dart';
import 'package:airplane_booking_app/presentation/bloc/destination/destination_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/login/login_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/logout/logout_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/register/register_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:airplane_booking_app/presentation/bloc/user/user_bloc.dart';
import 'package:airplane_booking_app/presentation/cubit/page_cubit.dart';
import 'package:airplane_booking_app/presentation/cubit/seat_cubit.dart';
import 'package:airplane_booking_app/presentation/pages/bonus_page.dart';
import 'package:airplane_booking_app/presentation/pages/getstarted_page.dart';
import 'package:airplane_booking_app/presentation/pages/home_page.dart';
import 'package:airplane_booking_app/presentation/pages/login_page.dart';
import 'package:airplane_booking_app/presentation/pages/main_page.dart';
import 'package:airplane_booking_app/presentation/pages/register_page.dart';
import 'package:airplane_booking_app/presentation/pages/splash_page.dart';
import 'package:airplane_booking_app/presentation/pages/success_checkout_page.dart';
import 'package:airplane_booking_app/presentation/widgets/bottom_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => UserBloc(UserService()),
        ),
        BlocProvider(
          create: (context) => DestinationBloc(DestinationDatasource()),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(TransactionDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthDatasource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/get-started',
      builder: (BuildContext context, GoRouterState state) {
        return const GetstartedPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/bonus',
      builder: (BuildContext context, GoRouterState state) {
        return const BonusPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavbar();
      },
    ),
    // GoRoute(
    //   path: '/seat-page',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ChooseSeatPage(destination);
    //   },
    // ),
    // GoRoute(
    //   path: '/checkout',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CheckoutPage();
    //   },
    // ),
    GoRoute(
      path: '/success',
      builder: (BuildContext context, GoRouterState state) {
        return const SuccessChekoutPage();
      },
    ),
  ],
);
