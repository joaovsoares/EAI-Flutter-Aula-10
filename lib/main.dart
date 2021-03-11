import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'traducoes.dart';
import 'home.dart';
import 'i18n.dart';

void main() {
  runApp(InitApp());
}

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Traducoes.carregar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var corPrincipal = Colors.blue;
    var titulo = 'Pedra, papel e tesoura - EAI';

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', "BR"),
        const Locale('en', "US"),
      ],
      // Retorna um local que será usado pelo app
      localeResolutionCallback: (locale, supportedLocales) {
        // Verifica se o local do dispositivo é suportado
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // Se o local do dispositivo não for suportado, usa o primeiro
        // da lista (português, no caso)
        return supportedLocales.first;
      },
      title: titulo.i18n,
      darkTheme: ThemeData.dark().copyWith(primaryColor: corPrincipal),
      theme: ThemeData(
        primarySwatch: corPrincipal,
      ),
      home: I18n(
        //initialLocale: Locale("pt", "BR"),
        child: MyHomePage(title: titulo)
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
