import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Aryam@300324#


class SupabaseInit {
  static late final String supabaseUrl;
  static late final String supabaseAnonKey;

  static Future<void> initSupabase() async {
    supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? '';
    
    await Supabase.initialize(
      url: supabaseUrl, 
      publishableKey: supabaseAnonKey
    );
  }
}