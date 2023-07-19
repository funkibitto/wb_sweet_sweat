import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  return ref.watch(sharedPrefsAsyncProvider).requireValue;
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefsAsync(SharedPrefsAsyncRef ref) async {
  return await SharedPreferences.getInstance();
}
