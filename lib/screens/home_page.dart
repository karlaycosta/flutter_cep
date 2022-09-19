import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cep/services/cep_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resposta = ValueNotifier<String>('');
    final textCep = TextEditingController(text: '68455684');
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta VIACEP'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: textCep,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('CEP'),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Você deve informar um CEP! SEU ANIMAL';
                    }
                    final texto = valor.replaceAll(RegExp(r'[.-]'), '');
                    if (texto.length != 8) {
                      return 'Você deve informar um CEP com 8 dígitos!';
                    }
                    if (!validarCep(texto)) {
                      return 'Cep inválido';
                    }
                    // Passou na validação
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                child: const Text('Consultar'),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      resposta.value = '0';
                      final res = await consultar(textCep.text.replaceAll(RegExp(r'[.-]'), ''));
                      resposta.value = '$res';
                    } catch (e, s) {
                      resposta.value = 'Erro!';
                      // print(e);
                    }
                  }
                },
              ),
              const SizedBox(height: 40),
              ValueListenableBuilder<String>(
                valueListenable: resposta,
                builder: (context, res, child) {
                  if (res == '0') {
                    return const CircularProgressIndicator();
                  } else {
                    return Text(res,
                        style: const TextStyle(
                          fontSize: 28,
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
