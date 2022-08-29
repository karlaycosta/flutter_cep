import 'package:flutter/material.dart';
import 'package:flutter_cep/services/cep.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textCep = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta VIACEP'),
        centerTitle: true,
      ),
      body: Center(
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
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('Consultar'),
              onPressed: () {
                consultar(textCep.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
