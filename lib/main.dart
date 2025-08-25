import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/colors/colors_manager.dart';
import 'package:note_app/logic/theme/cubit.dart';
import 'package:note_app/presintation/screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/trans',
      fallbackLocale: Locale('en'),
      child: BlocProvider(create: (context) => ThemeCubit(), child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: ColorsManager.primary
          ),
          themeMode: themeMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const LoginScreen(),
        );
      },
    );
  }
}
