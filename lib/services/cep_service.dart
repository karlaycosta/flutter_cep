import 'dart:convert';
import 'dart:io';

import 'package:flutter_cep/models/cep.dart';
import 'package:http/http.dart';

// https://karlaycosta.cloudns.nz/ws/?
Future<Cep> consultar(String cep) async {
  if (cep.isEmpty) {
    throw ('Envia o CEP seu animal!');
  }
  if (validarCep(cep)) {
    final client = HttpClient();
    try {
      final req = await client.getUrl(Uri.http('cep.la', cep));
      req.headers.set('Accept', 'application/json', preserveHeaderCase: true);
      final res = await req.close();
      final body = await res.transform(utf8.decoder).join();
      // final res = await get(Uri.http('cep.la', cep),
      //     headers: {'Accept': 'application/json'});
      return Cep.fromJson(body);
    } catch (e) {
      rethrow;
    } finally {
      client.close();
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
