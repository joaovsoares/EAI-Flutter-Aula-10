import 'dart:math';
import 'jokenpoenum.dart';
import 'i18n.dart';

class JoKenPo {
  static String calcular(JoKenPoEnum opcaoJogador, JoKenPoEnum opcaoApp) {
    var resultado;

    if ((opcaoJogador == JoKenPoEnum.pedra && opcaoApp == JoKenPoEnum.tesoura) ||
    (opcaoJogador == JoKenPoEnum.tesoura && opcaoApp == JoKenPoEnum.papel) ||
    (opcaoJogador == JoKenPoEnum.papel && opcaoApp == JoKenPoEnum.pedra) ) {
      resultado = 'Parabéns, você ganhou'.i18n;
    } 
    else if ((opcaoApp == JoKenPoEnum.pedra && opcaoJogador == JoKenPoEnum.tesoura) ||
    (opcaoApp == JoKenPoEnum.tesoura && opcaoJogador == JoKenPoEnum.papel) ||
    (opcaoApp == JoKenPoEnum.papel && opcaoJogador == JoKenPoEnum.pedra)) {
      resultado = 'Você perdeu, tente novamente!'.i18n;
    } 
    else {
      resultado = 'Empate'.i18n;
    }

    return resultado;
  }

  static Map<String, dynamic> jogar(JoKenPoEnum opcaoJogador) {
    var resultado = new Map<String, dynamic>();
    var numeroAleatorioDeZeroAteDois = Random().nextInt(3);
    var opcaoApp = JoKenPoEnum.values[numeroAleatorioDeZeroAteDois];

    resultado['opcaoApp'] = opcaoApp;
    resultado['mensagem'] = JoKenPo.calcular(opcaoJogador, opcaoApp);

    return resultado;
  }
}