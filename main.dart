import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_colors.dart';
import 'providers/cart_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/store_provider.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => StoreProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const HadeyatiApp(),
    ),
  );
}

class HadeyatiApp extends StatelessWidget {
  const HadeyatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هديتي - Luxury Gifting',
      debugShowCheckedModeBanner: false,
      
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.navy950,
        primaryColor: AppColors.gold500,
        fontFamily: 'Cairo',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.gold500,
          secondary: AppColors.gold400,
          surface: AppColors.navy900,
          background: AppColors.navy950,
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginWrapper(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic logic to check if already authenticated
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (auth.isAuthenticated) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
