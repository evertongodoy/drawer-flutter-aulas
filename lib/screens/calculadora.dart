import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({Key? key}) : super(key: key);

  @override
  _CalculadoraAppState createState() => _CalculadoraAppState();
}

// Define a classe de estado para o widget CalculadoraScreen.
// Ao estender State<CalculadoraScreen>, você associa esse estado ao widget correspondente, permitindo gerenciar e reagir a mudanças.
class _CalculadoraAppState extends State<CalculadoraApp> {
  
  // Cria dois controladores para cada TextField: _c1 e _c2.
  // TextEditingController permite ler, editar e ouvir os textos digitados nos campos
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  // Declara um campo privado que armazena o resultado calculado.
  // Inicialmente vazio ('') e será atualizado dinamicamente com setState().
  String _resultado = '';

  // Define um método privado (_calcular) que recebe uma operação (+, -, *, /) e executa a lógica da calculadora. 
  void _calcular(String op) {
    // Extrai o texto dos controladores e faz o parse para double, permitindo vírgulas como separador decimal.
    // tryParse retorna null se a entrada for inválida.
    final n1 = double.tryParse(_c1.text.replaceAll(',', '.'));
    final n2 = double.tryParse(_c2.text.replaceAll(',', '.'));
    // Verifica se houve erro de parse (null).
    if (n1 == null || n2 == null) {
      // Se sim, usa setState() para atualizar _resultado e re-renderizar a UI , parando a execução com return.
      setState(() => _resultado = 'Entrada inválida');
      return;
    }

    // Executa a operação matemática com base em op
    // Inclui verificação contra divisão por zero.
    // Resultado armazenado em res.
    double res;
    switch (op) {
      case '+': res = n1 + n2; break;
      case '-': res = n1 - n2; break;
      case '*': res = n1 * n2; break;
      case '/':
        if (n2 == 0) {
          setState(() => _resultado = 'Divisão por zero');
          return;
        }
        res = n1 / n2; break;
      default: return;
    }
    // // Usa setState() para atualizar _resultado com o valor calculado convertido para string.
    // Isso aciona a reconstrução da UI para refletir o novo resultado
    setState(() => _resultado = res.toString());
  }

  // Método build() é chamado sempre que há mudanças – inicial ou após setState().
  // Retorna a estrutura visual atualizada da tela.
  @override
  Widget build(BuildContext context) {
    
    // Scaffold fornece a estrutura básica da tela: AppBar, corpo, etc.
    return Scaffold(
      // Define a barra superior com título fixo e cor baseada no tema atual.
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Usa Padding e Column para estruturar os widgets com espaçamento.
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Primeiro TextField vinculado a _c1.
            // Permite entrada numérica e exibe um rótulo.
            TextField(
              controller: _c1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Digite um número, ex: 1'),
            ),
            //Segundo campo de texto, com as mesmas configurações, mas ligado a _c2.
            TextField(
              controller: _c2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Digite um número, ex: 1'),
            ),
            // Cria espaço vertical entre campos e botões.
            const SizedBox(height: 16),
            // Linha com quatro botões para as operações. Cada um chama _calcular com o operador correspondente ao ser pressionado.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calcular('+'), child: const Text('SUM')),
                ElevatedButton(onPressed: () => _calcular('-'), child: const Text('SUB')),
                ElevatedButton(onPressed: () => _calcular('*'), child: const Text('MUL')),
                ElevatedButton(onPressed: () => _calcular('/'), child: const Text('DIV')),
              ],
            ),
            // Espaço adicional antes de exibir o resultado.
            const SizedBox(height: 24),
            // Exibe o resultado atual, com estilo destacado. Atualiza automaticamente sempre que _resultado muda.
            Text(
              _resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
