import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
   
  const MessageScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No Data desde Message Screen';

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notificaciones Push II')),
      ),
      body: Center(
        widthFactor: double.infinity,
        //  me daba error de string to objeto y lo coloque asi '$args'
         child: Text('$args', textAlign: TextAlign.center, style: const TextStyle(fontSize: 30,)),
      ),
    );
  }
}