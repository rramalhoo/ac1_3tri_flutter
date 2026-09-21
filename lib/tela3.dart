import 'package:flutter/material.dart';
import 'tela4.dart';

class Tela3 extends StatefulWidget {
  final String nome;
  final int tripulantes;
  final double distancia;
  final int dias;
  final double custoCombustivel;
  final double custoOxigenio;
  final double orcamentoTotal;

  const Tela3({
    super.key,
    required this.nome,
    required this.tripulantes,
    required this.distancia,
    required this.dias,
    required this.custoCombustivel,
    required this.custoOxigenio,
    required this.orcamentoTotal,
  });

  @override
  State<Tela3> createState() => _Tela3State();
}

class _Tela3State extends State<Tela3> {
  final orcamentoController = TextEditingController();
  final velocidadeController = TextEditingController();

  String erro = '';

  void avancar() {
    double orcamento =
        double.tryParse(orcamentoController.text) ?? 0;

    double velocidade =
        double.tryParse(velocidadeController.text) ?? 0;

    if (orcamento <= 0 || velocidade <= 0 || velocidade > 100) {
      setState(() {
        erro = 'Preencha os campos corretamente';
      });
      return;
    }

    double saldo =
        orcamento - widget.orcamentoTotal;

    double desgaste =
        (velocidade / 10) * widget.dias;

    bool riscoPane = velocidade > 80;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela4(
          nome: widget.nome,
          tripulantes: widget.tripulantes,
          distancia: widget.distancia,
          dias: widget.dias,
          custoCombustivel: widget.custoCombustivel,
          custoOxigenio: widget.custoOxigenio,
          orcamentoTotal: widget.orcamentoTotal,
          orcamentoDisponivel: orcamento,
          saldo: saldo,
          velocidade: velocidade,
          desgaste: desgaste,
          riscoPane: riscoPane,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Risco'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: orcamentoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Orçamento disponível',
              ),
            ),

            TextField(
              controller: velocidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Velocidade dos motores (%)',
              ),
            ),

            SizedBox(height: 20),

            Text(
              erro,
              style: TextStyle(color: Colors.red),
            ),

            ElevatedButton(
              onPressed: avancar,
              child: Text('Ver Relatório'),
            ),
          ],
        ),
      ),
    );
  }
}