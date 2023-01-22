# Proyecto final:  Bloque de Especialitzación en Tecnologías Multimedia Aplicadas (BETMA) VII

Esta App consiste en un proyecto final universitario de la clase de BETMAVII. Consiste en una pequeña aplicación fullstack con la ayuda de:

- [Jikan API](https://jikan.moe/), una REST API de anime y manga
- [Flutter](flutter.dev), el framework de desarollo de aplicaciones multiplataforma
- [Firestore](https://firebase.google.com/products/firestore), una base de datos no relacional incluida en la plataforma de desarrollo de apps [Firebase](https://firebase.google.com/), de Google. 
- [Riverpod](https://riverpod.dev/), Un framework de vinculación de datos y almacenamiento en caché reactivo, útil para las conexiones y peticiones asincrónicas.

## ¿Cómo empezar? 🚀

Este proyecto es un punto de partida para una aplicación Flutter.

🚨 Disclaimer! Las credenciales de conexión a la base de datos de Firebase no están incluidas en el repositorio. Para conectarte a nuestra base de dados contacta a ruben.andreu.chiquin@estudiantat.upc.edu

Algunos recursos para comenzar si este es su primer proyecto de Flutter:

- [Laboratorio: Desarrolla tu primera aplicación Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cook Book: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

Para obtener ayuda para comenzar con el desarrollo de Flutter, consulte la
[documentación en línea](https://docs.flutter.dev/), que ofrece tutoriales,
muestras, orientación sobre desarrollo móvil y una referencia completa de la API.


### Riverpod

Usamos riverpod para todas las peticiones a jikan API y a Firebase. También utilizamos generación de código automática para los providers. Para iniciar la generación de código, el cómando es:

```dart run build_runner watch```

Para más información, aquí hay varios links de utilidad:

- [Documentación oficial de Riverpod](https://docs-v2.riverpod.dev/docs/getting_started)
- [Un blog muy práctico en relación a la automatización de generación de providers](https://codewithandrea.com/articles/flutter-riverpod-generator/)
