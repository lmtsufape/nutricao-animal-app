import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:thunderapp/app.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const App());
}
