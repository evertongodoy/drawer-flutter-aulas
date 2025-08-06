import 'dart:convert';
import 'package:drawer_aula/models/agenda.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaTelefonica extends StatefulWidget {
  const ListaTelefonica({super.key});

  @override
  _ListaTelefonicaState createState() => _ListaTelefonicaState();
}

class _ListaTelefonicaState extends State<ListaTelefonica> {
  late Future<Agenda> _agendaFuture;

  @override
  void initState() {
    super.initState();
    _agendaFuture = carregarAgenda();
  }

  Future<Agenda> carregarAgenda() async {
    final urlString =
        'https://fc744478-db37-4442-ac7d-761f8d87dca1.mock.pstmn.io/lista-telefonica';
    final url = Uri.parse(urlString);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Agenda.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao carregar agenda: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Telefônica')),
      body: FutureBuilder<Agenda>(
        future: _agendaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          final contatos = snapshot.data!.dados;
          return ListView.builder(
            itemCount: contatos.length,
            itemBuilder: (context, index) {
              final contato = contatos[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(contato.pessoa),
                subtitle: Text(contato.telefone),
              );
            },
          );
        },
      ),
    );
  }
}



/*
class _ListaTelefonicaState extends State<ListaTelefonica> {
  final List<String> _contatos = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarContato() {
    final contato = _controller.text.trim();
    if (contato.isNotEmpty) {
      setState(() {
        _contatos.add(contato);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Telefônica'),
      ),
      body:
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nome do Contato'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adicionarContato,
              child: const Text('Adicionar Contato'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _contatos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_contatos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/