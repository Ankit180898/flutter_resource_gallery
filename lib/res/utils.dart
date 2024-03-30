import 'package:supabase_flutter/supabase_flutter.dart';

class Utils {
  static String supabaseUrl = "https://thidjugysjrfrbdfkcdc.supabase.co";
  static String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoaWRqdWd5c2pyZnJiZGZrY2RjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2NTMxNDgsImV4cCI6MjAyNzIyOTE0OH0.tYIr65U-W77Y61kLKnYbqaO3ITd6ds0FDxquCiPAeKI";
  final supabase=Supabase.instance.client;
  static SupabaseClient supabaseClient =
      SupabaseClient(supabaseUrl, supabaseKey);
}
