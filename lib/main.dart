import 'package:cyclego/config/routes/on_generate_route.dart';
import 'package:cyclego/features/auth/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:cyclego/features/auth/presentation/cubit/user/get_single_user/cubit/single_user_cubit.dart';
import 'package:cyclego/features/auth/presentation/pages/auth/login_page.dart';
import 'package:cyclego/features/cycle/presentation/bloc/all_cycles/cycle_cubit.dart';
import 'package:cyclego/features/cycle/presentation/bloc/cycle_details/cycle_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cycle/presentation/pages/home/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.intt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(context),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialsCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<SingleUserCubit>(),
        ),
         BlocProvider(
          create: (_) => di.sl<CycleCubit>(),
        ),
          BlocProvider(
          create: (_) => di.sl<CycleDetailsCubit>(),
        ),

      ],
      child: MaterialApp(
        title: 'CycleRent',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(
                    uid: authState.uid,
                  );
                } else {
                  return const LoginPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}