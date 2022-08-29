import 'package:http/http.dart';

void consultar(String cep) async {
  final res = await get(Uri.https('viacep.com.br', '/ws/$cep/json/'));
  if (res.statusCode == 200) {
    print(res.body);
  } else {
    print('Ocorreu um erro!');
  }
}
