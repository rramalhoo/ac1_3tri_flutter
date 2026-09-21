import 'package:flutter/material.dart';
import 'tela1.dart';

class Tela4 extends StatelessWidget {
  final String nome;
  final int tripulantes;
  final double distancia;
  final int dias;
  final double custoCombustivel;
  final double custoOxigenio;
  final double orcamentoTotal;
  final double orcamentoDisponivel;
  final double saldo;
  final double velocidade;
  final double desgaste;
  final bool riscoPane;

  const Tela4({
    super.key,
    required this.nome,
    required this.tripulantes,
    required this.distancia,
    required this.dias,
    required this.custoCombustivel,
    required this.custoOxigenio,
    required this.orcamentoTotal,
    required this.orcamentoDisponivel,
    required this.saldo,
    required this.velocidade,
    required this.desgaste,
    required this.riscoPane,
  });

  @override
  Widget build(BuildContext context) {
    String status;

    if (saldo >= 0 && velocidade <= 80) {
      status = 'Missão Concluída com Sucesso';
    } else {
      status = 'Missão Resgatada com Avarias';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Relatório Final'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comandante: $nome'),
            Text('Tripulantes: $tripulantes'),

            SizedBox(height: 10),

            Text('Distância: $distancia anos luz'),
            Text('Dias: $dias'),

            SizedBox(height: 10),

            Text(
              'Custo Combustível: \$${custoCombustivel.toStringAsFixed(2)}',
            ),

            Text(
              'Custo Oxigênio: \$${custoOxigenio.toStringAsFixed(2)}',
            ),

            Text(
              'Orçamento Total: \$${orcamentoTotal.toStringAsFixed(2)}',
            ),

            SizedBox(height: 10),

            Text(
              'Orçamento Disponível: \$${orcamentoDisponivel.toStringAsFixed(2)}',
            ),

            Text(
              'Saldo Final: \$${saldo.toStringAsFixed(2)}',
              style: TextStyle(
                color: saldo < 0 ? Colors.red : Colors.black,
              ),
            ),

            if (saldo < 0)
              Text(
                'Risco Crítico de Falência Financeira',
                style: TextStyle(color: Colors.red),
              ),

            SizedBox(height: 10),

            Text('Velocidade: $velocidade%'),

            Text(
              'Fator de Desgaste: ${desgaste.toStringAsFixed(2)}',
            ),

            Text(
              riscoPane
                  ? 'Alerta: Risco de Pane'
                  : 'Sem alerta de pane',
            ),

            SizedBox(height: 10),

            Text('Status: $status'),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tela1(),
                  ),
                  (route) => false,
                );
              },
              child: Text('Reiniciar Missão'),
            ),
          ],
        ),
      ),
    );
  }
}