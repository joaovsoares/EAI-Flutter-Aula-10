import 'package:i18n_extension/i18n_extension.dart';
import 'traducoes.dart';

extension Localization on String {
  String get i18n => localize(this, Traducoes.traducoesCarregadas);
}