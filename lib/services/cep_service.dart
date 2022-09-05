import 'package:flutter_cep/models/cep.dart';
import 'package:http/http.dart';

Future<Cep> consultar(String cep) async {
  if (cep.isEmpty) {
    throw ('Envia o CEP seu animal!');
  }
  if (validarCep(cep)) {
    try {
      final res = await get(Uri.https('viacep.com.br', '/ws/$cep/json/'));
      return Cep.fromJson(res.body);
    } catch (e) {
      rethrow;
    }
  } else {
    throw ('CEP inválido');
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
