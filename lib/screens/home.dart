import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page das aulas')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Nosso Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Adivinhar o número'),
              onTap: () {
                Navigator.pushNamed(context, '/adivinhar');
              },
            ),
            ListTile(
              title: const Text('Calculadora'),
              onTap: () {
                Navigator.pushNamed(context, '/calculadora');
              },
            ),
            ListTile(
              title: const Text('Temperatura'),
              onTap: () {
                Navigator.pushNamed(context, '/conversor-temperatura');
              },
            ),
            ListTile(
              title: const Text('Lista Telefônica'),
              onTap: () {
                Navigator.pushNamed(context, '/lista-telefonica');
              },
            ),
             ListTile(
              title: const Text('Cadastro Pessoa'),
              onTap: () {
                Navigator.pushNamed(context, '/cadastro-pessoa');
              },
            ),
            ListTile(
              title: const Text('Salvar Pessoa SQLite'),
              onTap: () {
                Navigator.pushNamed(context, '/menu-sqlite');
              },
            ),
             ListTile(
              title: const Text('Tela do Flutter Flow'),
              onTap: () {
                Navigator.pushNamed(context, '/flow_1');
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome to the Home Page!',
        style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onBackground),
      )),
    );
  }
}
