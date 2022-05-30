import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/app.dart';
import 'package:thunderapp/screens/home/home_screen_controller.dart';
import 'package:thunderapp/shared/core/selected_item.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeScreenController()),
    ChangeNotifierProvider(create: (_) => SelectedItem())
  ], child: const App());

  runApp(const App());
}
