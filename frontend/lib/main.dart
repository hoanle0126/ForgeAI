import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/data/datasources/local/token_storage.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load();

  // Initialize local Hive database
  await Hive.initFlutter();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final tokenStorage = TokenStorage(prefs);

  runApp(
    ProviderScope(
      overrides: [tokenStorageProvider.overrideWithValue(tokenStorage)],
      child: const ForgeAIApp(),
    ),
  );
}

class ForgeAIApp extends ConsumerWidget {
  const ForgeAIApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'ForgeAI',
      theme: appTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
