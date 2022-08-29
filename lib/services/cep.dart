import 'package:http/http.dart';

void consultar(String cep) async {
  if (cep.isEmpty) {
    print('Envia o CEP seu animal!');
    return;
  }
  if (validarCep(cep)) {
    try {
      final res = await get(Uri.https('viacep.com.br', '/ws/$cep/json/'));
      print(res.body);
    } catch (e) {
      print('Ocorreu um erro!');
    }
  } else {
    print('CEP inválido');
  }
}

bool validarCep(String cep) {
  if (cep.length == 8) {
    for (var i = 0; i < cep.length; i++) {
      switch (cep[i]) {
        case '0':
          continue;
        case '1':
          continue;
        case '2':
          continue;
        case '3':
          continue;
        case '4':
          continue;
        case '5':
          continue;
        case '6':
          continue;
        case '7':
          continue;
        case '8':
          continue;
        case '9':
          continue;
        default:
          return false;
      }
    }
    return true;
  }
  return false;
}
