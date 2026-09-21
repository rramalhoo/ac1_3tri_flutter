import 'package:flutter/material.dart';
import 'tela3.dart';

class Tela2 extends StatefulWidget {
  final String nome;
  final int tripulantes;
  final double distancia;

  const Tela2({
    super.key,
    required this.nome,
    required this.tripulantes,
    required this.distancia,
  });

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  final diasController = TextEditingController();
  final custoKgController = TextEditingController();

  String erro = '';

  void avancar() {
    int dias = int.tryParse(diasController.text) ?? 0;
    double custoKg = double.tryParse(custoKgController.text) ?? 0;

    if (dias <= 0 || custoKg <= 0) {
      setState(() {
        erro = 'Preencha os campos corretamente';
      });
      return;
    }

    double combustivelTotal =
        (widget.distancia * widget.tripulantes) * 1000;

    double custoCombustivel =
        combustivelTotal * custoKg;

    double oxigenio =
        widget.tripulantes * dias * 2.5;

    double custoOxigenio =
        oxigenio * 50;

    double orcamentoTotal =
        custoCombustivel + custoOxigenio;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela3(
          nome: widget.nome,
          tripulantes: widget.tripulantes,
          distancia: widget.distancia,
          dias: dias,
          custoCombustivel: custoCombustivel,
          custoOxigenio: custoOxigenio,
          orcamentoTotal: orcamentoTotal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recursos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: diasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Dias estimados da viagem',
              ),
            ),

            TextField(
              controller: custoKgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Custo por kg de combustível',
              ),
            ),

            SizedBox(height: 20),

            Text(
              erro,
              style: TextStyle(color: Colors.red),
            ),

            ElevatedButton(
              onPressed: avancar,
              child: Text('Avançar'),
            ),
          ],
        ),
      ),
    );
  }
}