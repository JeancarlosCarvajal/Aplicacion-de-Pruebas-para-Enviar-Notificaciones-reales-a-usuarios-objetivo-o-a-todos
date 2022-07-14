import 'package:flutter/material.dart';
import 'package:notificaciones/screens/screens.dart';
import 'package:notificaciones/services/push_notification_service.dart';

void main() async {

    // WidgetsFlutterBinding me evita error al usar la clase de las notificaciones antes de crear el widget
    WidgetsFlutterBinding.ensureInitialized();
    // para obtener el token del dispositivo
    await PushNotificationService.initializeApp();

    runApp(const MyApp());
 
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => const HomeScreen(),
        'message' : ( _ ) => const MessageScreen(), 
      },
    );
  }
}