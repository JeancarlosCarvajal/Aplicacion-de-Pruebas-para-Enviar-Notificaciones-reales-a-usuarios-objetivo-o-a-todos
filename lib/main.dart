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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // generar key para cambiar de pantalla con la notificacion
  // tiene referencia al material App
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  // NOTA: la redireccion a otra pantalla se debe hacer cual se tenga creado el widget inicial 

  // al ser un satefull widget me permite correr el initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // esperar o hacer otra cosa y tengo acceso al context
    PushNotificationService.messagesStream.listen((message) {

      // moverme a otra pagina con la notificacion
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      // Va aparecer en consola cuando llegue una notificacion
      print('My app: $message');

      // creamos el final snackBar para meterlo en em currentState
      final snackBar = SnackBar(content: Text(message));

      //usemos el GlobalKey. coloque ? para decirle que si no lo tiene no haga nada y siga adelante
      messengerKey.currentState?.showSnackBar(snackBar);

    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home' : ( _ ) => HomeScreen(),
        'message' : ( _ ) => const MessageScreen(), 
      },
    );
  }
}