//dependencies:
//  flutter:
//    sdk: flutter
//  flutter_localizations:
//    sdk: flutter
//  i18n_extension: ^1.4.2
//
//flutter:
//  assets:
//    - assets/i18n/
//    - assets/i18n/pt_BR.json
//    - assets/i18n/en_US.json
import 'package:i18n_extension/io/import.dart';
import 'package:i18n_extension/i18n_extension.dart';

class Traducoes {
  static ITranslations traducoesCarregadas;

  static Future carregar() async {
    Traducoes.traducoesCarregadas = Translations.byLocale('pt_BR')
      + await JSONImporter().fromAssetDirectory('assets/i18n/');
  }
}