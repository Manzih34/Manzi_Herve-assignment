import 'package:apo/depedency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'theme_controller.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(() {
      return GetMaterialApp(
        title: 'Calculat',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('battery_notifier');

  @override
  void initState() {
    super.initState();
    startListening();
  }

  Future<void> startListening() async {
    try {
      await platform.invokeMethod('startListening');
    } on PlatformException catch (e) {
      print("Failed to start listening: '${e.message}'.");
    }
  }

  Future<void> stopListening() async {
    try {
      await platform.invokeMethod('stopListening');
    } on PlatformException catch (e) {
      print("Failed to stop listening: '${e.message}'.");
    }
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Notifier'),
      ),
      body: Center(
        child: Text('Listening for battery changes...'),
      ),
    );
  }
}
