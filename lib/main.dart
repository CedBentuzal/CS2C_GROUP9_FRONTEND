import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'pages/default.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures async calls work in main()
  await dotenv.load(fileName: ".env");

  print("Loaded API Base URL: ${dotenv.env['BASE_URL']}"); // Debugging

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultPage(),
    );
  }
}
