 
// SHA1: 18:C2:1B:4D:76:8D:FF:C9:01:5A:D2:56:61:BF:CF:0E:32:C7:78:18


import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; 

class PushNotificationService {
  // hare estatico para evitar inicializar mi clases y hacerlo estatico mas facil
  // va a saber cual es el proyecto y el id del proyecto
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  // generar el token
  static String? token;

  // para ser usado mas abajo
  static final StreamController<String> _messageStream = StreamController.broadcast(); 
  
  // para ser usado mas abajo en el token
  static late final String _tokenStream;

  // getter estatico, retorna el _messageStream.stream para escucharlo facilmente
  static Stream<String> get messagesStream => _messageStream.stream; 

  // getter estatico, retorna el _messageStream.stream para escucharlo facilmente
  static String get tokenDispositivo => _tokenStream; 

  // Privado dentro de esta mis ma clase
  static Future _backgroundHandeler(RemoteMessage message) async{
    print('onBackground Handler ${message.messageId}');
    // data es para ver los mas datos enviados en la notificacion como id etc
    print(message.data); 
    // Agrego el titulo al mensaje stream
    // _messageStream.add(message.notification?.body ?? 'No title');    
    _messageStream.add(message.data['product'] ?? 'No Data');
  } 
  
  // Privado dentro de esta mis ma clase
  static Future _onMessageHandler(RemoteMessage message) async{
    print('onMessage Handler ${message.messageId}');
    // data es para ver los mas datos enviados en la notificacion como id etc
    print(message.data); 
    // Agrego el titulo al mensaje stream
    // _messageStream.add(message.notification?.body ?? 'No title');    
    _messageStream.add(message.data['product'] ?? 'No Data');

  } 
  
  // Privado dentro de esta mis ma clase
  static Future _onMessageOpenApp(RemoteMessage message) async{
    print('onMessageOpenApp Handler ${message.messageId}');
    // data es para ver los mas datos enviados en la notificacion como id etc
    print(message.data); 
    // Agrego el titulo al mensaje stream
    // _messageStream.add(message.notification?.body ?? 'No title');    
    _messageStream.add(message.data['product'] ?? 'No Data');

  }

  // configurar inicializar instancia. se debe ejecutar antes de recibir cualquier tipo de notificaciones
  static Future initializeApp() async {

    // push notifications. inicializa la aplicacion
    await Firebase.initializeApp();

    // pedir permisos para las notificaccion. coloco await para que se detenga hasta obtener esa configuracion
    await requestPermission();

    // almacena token. aqui esta el token del usuario, se puede enviar a alguna base de datos se gustan
    token = await FirebaseMessaging.instance.getToken();
    print('Token del Dispositivo: $token');

    _tokenStream = token ?? 'No tiene Token';

    // definiar handlers
    FirebaseMessaging.onBackgroundMessage( _backgroundHandeler );

    // emite algo de remote message
    FirebaseMessaging.onMessage.listen( _onMessageHandler );

    // mensaje al abrir la app
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );

    // local notifications




  }

  // cerramos el stream controller
  static closeString() {
    _messageStream.close();
  }

  // establecer permisos segun la documentacion, Permiso para notificaciones PUSH
  // https://firebase.flutter.dev/docs/messaging/permissions#requesting-permissions
  static requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User push notifications status ${ settings.authorizationStatus }');
  }

}