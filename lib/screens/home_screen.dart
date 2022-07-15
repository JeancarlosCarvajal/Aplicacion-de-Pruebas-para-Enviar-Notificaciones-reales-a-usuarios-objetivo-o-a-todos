import 'package:flutter/material.dart';
import 'package:notificaciones/services/push_notification_service.dart'; 

class HomeScreen extends StatelessWidget {

  final String token = PushNotificationService.tokenDispositivo;
   
  HomeScreen({
    Key? key,  
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('Token del Dispositivo', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            Text(token, textAlign: TextAlign.center),

          ],
        ),
      ),
    );
  }
}