

/*
  NOTA: Hacer este trabajo en el Back End :NOTA

  token de mi telefono J4. por favor no me envies notificaciones haha. Gracias
  "dbBJplKHTYiEIOrr4DWli5:APA91bHlZ7rcGm-ygXw05MjBOAcLOa3PHjlDk9ESipbdbStciBVnacZ1OHtkveWfLSygUP1Z97hWWNolgNHCyGl-jmktHrJi2KUWh0daoTCskwDGCEM-A8Y1iFYlfmCkINLOUSCUgbfS"

  En el HEADER de postman colocar la llave:

  KEY:Authorization  

  VALUE:key="Credenciales del Servidor, se encuentra en cloudmessaging, si no se ve debes habilitarla en los 3 puntitos"

  En el Body de postman colocar el siguiente JSon segun indica la documentacion 
  https://firebase.google.com/docs/cloud-messaging/auth-server?hl=es-419#authorize-http-requests

  {
    "notification": {
        "body": "Texto de la Notificacion !!!",
        "title": "Titulo"
    },
    "priority": "high",
    "data": {
        "product": "Agua Fria"
    },
    "to": "cZ7uNzZwSqWJS0zp2vOpfV:APA91bFuf_nSYjO2nrOxJejszHpd03EI8n9-lO8TkdtpIX0S6YSjm1ya8fzZZMJB3JIYtfYMobsmX-1TwSAkgHUbsJunD80FMjMDaQ-v-7lsjNrq0Pr-ThERPeE8_Q2d4fz9jwKFDgc8"
  }

  El "to" es el Token del dispositivo



  Representacion en forma de Curl:
  
  curl --location --request POST 'https://fcm.googleapis.com/fcm/send' \
  --header 'Authorization: key=AAAAXAkOm5Q:APA91bFnxMTgv4FKn5j7YLzF9CPLd3Qe_oq38t4MvJgh9Z1KBfo9qp_NAVf6lpkAmOgSOXLzHREQbP4qD-U4RMqbWJV-FgfAOXUbJ4Z4HDboUFcfsvcvURbYO9iggYqEp_z5L-VyuFJQ' \
  --header 'Content-Type: application/json' \
  --data-raw '{
      "notification": {
          "body": "Soy una Notificacion desde FireBase",
          "title": "Notificacion de Prueba"
      },
      "priority": "high",
      "data": {
          "product": "Abriendo Notificaciones desde FireBase"
      },
      "to": "dIkrDFyvS9yYL2jkSe0aBX:APA91bF2MyrGt_eVjXcHSVCXuJvaWDivf7DJqsXD6IZMfS2pLH1mBA0Wo1i_JlyP3LmQPlHfCSW6UbRlSPGwgvu7M2yKlx-ljTEm_-nBmKutujmCMIF2F2Ke_8O67TyArzpuTBw-8SDl"
  }'

*/