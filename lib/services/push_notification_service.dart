 
// SHA1: 18:C2:1B:4D:76:8D:FF:C9:01:5A:D2:56:61:BF:CF:0E:32:C7:78:18


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  // hare estatico para evitar inicializar mi clases y hacerlo estatico mas facil
  // va a saber cual es el proyecto y el id del proyecto
  static FirebaseMessaging message = FirebaseMessaging.instance;

  // generar el token
  static String? token;

  // Privado dentro de esta mis ma clase
  static Future _backgroundHandeler(RemoteMessage message) async{
    print('onBackground Handler ${message.messageId}');
  } 
  
  // Privado dentro de esta mis ma clase
  static Future _onMessageHandler(RemoteMessage message) async{
    print('onMessage Handler ${message.messageId}');
  } 
  
  // Privado dentro de esta mis ma clase
  static Future _onMessageOpenApp(RemoteMessage message) async{
    print('onMessageOpenApp Handler ${message.messageId}');
  }

  // configurar inicializar instancia. se debe ejecutar antes de recibir cualquier tipo de notificaciones
  static Future initializeApp() async {

    // push notifications. inicializa la aplicacion
    await Firebase.initializeApp();
    // almacena token. aqui esta el token del usuario, se puede enviar a alguna base de datos se gustan
    token = await FirebaseMessaging.instance.getToken();
    print('Token del Dispositivo: $token');


    // definiar handlers
    FirebaseMessaging.onBackgroundMessage( _backgroundHandeler );

    // emite algo de remote message
    FirebaseMessaging.onMessage.listen( _onMessageHandler );

    // mensaje al abrir la app
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );

    // local notifications




  }






}