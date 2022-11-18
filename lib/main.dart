import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/app.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/screens/home/home_screen_controller.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';
import 'package:thunderapp/screens/sign_in/sign_in_repository.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';
import 'package:thunderapp/shared/core/selected_item.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeScreenController()),
    ChangeNotifierProvider(create: (_) => SelectedItem()),
    ChangeNotifierProvider(create: (context) => UserModel()),
    ChangeNotifierProvider(create: (_) => SignInRepository()),
    ChangeNotifierProvider(create: (_) => SignInController())
  ], child: const App());

  runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}
