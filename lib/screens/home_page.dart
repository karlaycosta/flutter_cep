import 'package:flutter/material.dart';
import 'package:flutter_cep/services/cep.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textCep = TextEditingController();
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('CEP'),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Você deve informar um CEP! SEU ANIMAL';
                    }
                    if (valor.length != 8) {
                      return 'Você deve informar um CEP com 8 dígitos!';
                    }
                    if (!validarCep(valor)) {
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    consultar(textCep.text);
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
