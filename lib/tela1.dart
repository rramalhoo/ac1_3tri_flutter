import 'package:flutter/material.dart';
import 'tela2.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  final nomeController = TextEditingController();
  final tripulantesController = TextEditingController();
  final distanciaController = TextEditingController();

  String erro = '';

  void avancar() {
    String nome = nomeController.text;
    int tripulantes = int.tryParse(tripulantesController.text) ?? 0;
    double distancia = double.tryParse(distanciaController.text) ?? 0;

    if (nome.isEmpty || tripulantes <= 0 || distancia <= 0) {
      setState(() {
        erro = 'Preencha os campos corretamente';
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela2(
          nome: nome,
          tripulantes: tripulantes,
          distancia: distancia,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração Inicial'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Comandante',
              ),
            ),

            TextField(
              controller: tripulantesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade de Tripulantes',
              ),
            ),

            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Distância em Anos Luz',
              ),
            ),

            SizedBox(height: 20),

            Text(
              erro,
              style: TextStyle(color: Colors.red),
            ),

            ElevatedButton(
              onPressed: avancar,
              child: Text('Avançar para Recursos'),
            ),
          ],
        ),
      ),
    );
  }
}