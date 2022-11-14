import 'package:flutter/material.dart';

Map<int, Color> kMEEDRed = {
  50: Color.fromRGBO(251, 45, 59, 0.1),
  100: Color.fromRGBO(251, 45, 59, 0.2),
  200: Color.fromRGBO(251, 45, 59, 0.3),
  300: Color.fromRGBO(251, 45, 59, 0.4),
  400: Color.fromRGBO(251, 45, 59, 0.5),
  500: Color.fromRGBO(251, 45, 59, 0.6),
  600: Color.fromRGBO(251, 45, 59, 0.7),
  700: Color.fromRGBO(251, 45, 59, 0.8),
  800: Color.fromRGBO(251, 45, 59, 0.9),
  900: Color.fromRGBO(251, 45, 59, 1.0),
};

Map<int, Color> kMEEDAmber = {
  50: Color.fromRGBO(255, 148, 49, 0.1),
  100: Color.fromRGBO(255, 148, 49, 0.2),
  200: Color.fromRGBO(255, 148, 49, 0.3),
  300: Color.fromRGBO(255, 148, 49, 0.4),
  400: Color.fromRGBO(255, 148, 49, 0.5),
  500: Color.fromRGBO(255, 148, 49, 0.6),
  600: Color.fromRGBO(255, 148, 49, 0.7),
  700: Color.fromRGBO(255, 148, 49, 0.8),
  800: Color.fromRGBO(255, 148, 49, 0.9),
  900: Color.fromRGBO(255, 148, 49, 1.0),
};

Map<int, Color> kMEEDGreen = {
  50: Color.fromRGBO(0, 178, 59, 0.1),
  100: Color.fromRGBO(0, 178, 59, 0.2),
  200: Color.fromRGBO(0, 178, 59, 0.3),
  300: Color.fromRGBO(0, 178, 59, 0.4),
  400: Color.fromRGBO(0, 178, 59, 0.5),
  500: Color.fromRGBO(0, 178, 59, 0.6),
  600: Color.fromRGBO(0, 178, 59, 0.7),
  700: Color.fromRGBO(0, 178, 59, 0.8),
  800: Color.fromRGBO(0, 178, 59, 0.9),
  900: Color.fromRGBO(0, 178, 59, 1.0),
};

Map<int, Color> kRCPCHLightGrey = {
  50: Color.fromRGBO(217, 217, 217, 0.1),
  100: Color.fromRGBO(217, 217, 217, 0.2),
  200: Color.fromRGBO(217, 217, 217, 0.3),
  300: Color.fromRGBO(217, 217, 217, 0.4),
  400: Color.fromRGBO(217, 217, 217, 0.5),
  500: Color.fromRGBO(217, 217, 217, 0.6),
  600: Color.fromRGBO(217, 217, 217, 0.7),
  700: Color.fromRGBO(217, 217, 217, 0.8),
  800: Color.fromRGBO(217, 217, 217, 0.9),
  900: Color.fromRGBO(217, 217, 217, 1.0),
};

Map<int, Color> kRCPCHDarkGrey = {
  50: Color.fromRGBO(128, 128, 128, 0.1),
  100: Color.fromRGBO(128, 128, 128, 0.2),
  200: Color.fromRGBO(128, 128, 128, 0.3),
  300: Color.fromRGBO(128, 128, 128, 0.4),
  400: Color.fromRGBO(128, 128, 128, 0.5),
  500: Color.fromRGBO(128, 128, 128, 0.6),
  600: Color.fromRGBO(128, 128, 128, 0.7),
  700: Color.fromRGBO(128, 128, 128, 0.8),
  800: Color.fromRGBO(128, 128, 128, 0.9),
  900: Color.fromRGBO(128, 128, 128, 1.0),
};

MaterialColor MEEDRedColor = MaterialColor(0xFF880E4F, kMEEDRed);
MaterialColor MEEDAmberColor = MaterialColor(0xFF880E4F, kMEEDAmber);
MaterialColor MEEDGreenColor = MaterialColor(0xFF880E4F, kMEEDGreen);
// MaterialColor RCPCHLightBlue = MaterialColor(0xFF880E4F, kRCPCHLightBlue);
// MaterialColor RCPCHPink = MaterialColor(0xFF880E4F, kRCPCHPink);
MaterialColor RCPCHLightGrey = MaterialColor(0xFF880E4F, kRCPCHLightGrey);
MaterialColor RCPCHDarkGrey = MaterialColor(0xFF880E4F, kRCPCHDarkGrey);

const MaterialColor rcpchLightBlue =
    MaterialColor(_rcpchLightBluePrimaryValue, <int, Color>{
  50: Color(0xFFE2F4FD),
  100: Color(0xFFB8E5FB),
  200: Color(0xFF88D3F9),
  300: Color(0xFF58C1F6),
  400: Color(0xFF35B4F4),
  500: Color(_rcpchLightBluePrimaryValue),
  600: Color(0xFF0F9FF0),
  700: Color(0xFF0C96EE),
  800: Color(0xFF0A8CEC),
  900: Color(0xFF057CE8),
});
const int _rcpchLightBluePrimaryValue = 0xFF11A7F2;

const MaterialColor rcpchLightBlueAccent =
    MaterialColor(_rcpchLightBlueAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_rcpchLightBlueAccentValue),
  400: Color(0xFFAAD2FF),
  700: Color(0xFF91C5FF),
});
const int _rcpchLightBlueAccentValue = 0xFFDDEDFF;

const MaterialColor rcpchStrongBlue =
    MaterialColor(_rcpchStrongBluePrimaryValue, <int, Color>{
  50: Color(0xFFE7EDF9),
  100: Color(0xFFC2D1F0),
  200: Color(0xFF99B3E6),
  300: Color(0xFF7094DB),
  400: Color(0xFF527DD4),
  500: Color(_rcpchStrongBluePrimaryValue),
  600: Color(0xFF2E5EC7),
  700: Color(0xFF2753C0),
  800: Color(0xFF2049B9),
  900: Color(0xFF1438AD),
});
const int _rcpchStrongBluePrimaryValue = 0xFF3366CC;

const MaterialColor rcpchStrongBlueAccent =
    MaterialColor(_rcpchStrongBlueAccentValue, <int, Color>{
  100: Color(0xFFE0E6FF),
  200: Color(_rcpchStrongBlueAccentValue),
  400: Color(0xFF7A94FF),
  700: Color(0xFF607FFF),
});
const int _rcpchStrongBlueAccentValue = 0xFFADBDFF;

const MaterialColor rcpchDarkBlue =
    MaterialColor(_rcpchDarkBluePrimaryValue, <int, Color>{
  50: Color(0xFFE2E2EB),
  100: Color(0xFFB6B6CD),
  200: Color(0xFF8686AC),
  300: Color(0xFF56568A),
  400: Color(0xFF313171),
  500: Color(_rcpchDarkBluePrimaryValue),
  600: Color(0xFF0B0B50),
  700: Color(0xFF090947),
  800: Color(0xFF07073D),
  900: Color(0xFF03032D),
});
const int _rcpchDarkBluePrimaryValue = 0xFF0D0D58;

const MaterialColor rcpchDarkBlueAccent =
    MaterialColor(_rcpchDarkBlueAccentValue, <int, Color>{
  100: Color(0xFF6666FF),
  200: Color(_rcpchDarkBlueAccentValue),
  400: Color(0xFF0000FF),
  700: Color(0xFF0000E6),
});
const int _rcpchDarkBlueAccentValue = 0xFF3333FF;

const MaterialColor rcpchPink =
    MaterialColor(_rcpchPinkPrimaryValue, <int, Color>{
  50: Color(0xFFFBE0F1),
  100: Color(0xFFF6B3DB),
  200: Color(0xFFF080C3),
  300: Color(0xFFE94DAB),
  400: Color(0xFFE52699),
  500: Color(_rcpchPinkPrimaryValue),
  600: Color(0xFFDC007F),
  700: Color(0xFFD80074),
  800: Color(0xFFD3006A),
  900: Color(0xFFCB0057),
});
const int _rcpchPinkPrimaryValue = 0xFFE00087;

const MaterialColor rcpchPinkAccent =
    MaterialColor(_rcpchPinkAccentValue, <int, Color>{
  100: Color(0xFFFFF3F7),
  200: Color(_rcpchPinkAccentValue),
  400: Color(0xFFFF8DB6),
  700: Color(0xFFFF74A6),
});
const int _rcpchPinkAccentValue = 0xFFFFC0D7;
