# firebasereal

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Complementos

get -> flutter pub add get
firebase core -> flutter pub add firebase_core
firebase auth -> flutter pub add firebase_auth
cloud firestore -> flutter pub add cloud_firestore
google fonts -> flutter pub add google_fonts
uuid -> flutter pub add uuid
spinkit -> flutter pub add flutter_spinkit


## Estructura Bloc
controllers
views
services
theme
models

## Servicio de Firebase
Instalar Firebase CLI -> npm install -g firebase-tools
Activar Firebase CLI -> dart pub global activate flutterfire_cli
# Nota: Si al instalar flutterfire te aparece este error o advertencia Warning: Pub installs executables into C:\Users\artur\AppData\Local\Pub\Cache\bin, which is not on your path.
You can fix that by adding that directory to your system's "Path" environment variable.
A web search for "configure windows path" will show you how.
Activated flutterfire_cli 1.3.1. SOlo tienes que generar la variable de entorno, cerrar e iniciar de nuevo el proyecto

## Iniciar sesion en firebase y proyecto
Comando -> firebase login
Comando -> flutterfire configure --project=chattec-c41f4 
# Nota: Te creara en el proyecto un archivo firebase_options.dart

## Notas de Codigo






