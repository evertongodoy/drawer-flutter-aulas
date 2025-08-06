import 'package:drawer_aula/screens/cadastro_pessoa.dart';
import 'package:drawer_aula/screens/calculadora.dart';
import 'package:drawer_aula/screens/conversor_temperatura.dart';
import 'package:drawer_aula/screens/form_pessoa_screen.dart';
import 'package:drawer_aula/screens/home.dart';
import 'package:drawer_aula/screens/jogo_numero.dart';
import 'package:drawer_aula/screens/lista_telefonica.dart';
import 'package:drawer_aula/screens/listar_pessoas_screen.dart';
import 'package:drawer_aula/screens/salvar_pessoa_local_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      debugShowCheckedModeBanner: true,
      initialRoute: '/home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 234, 255, 0)),
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/adivinhar' : (context) => const JogoNumero(),
        '/calculadora': (context) => const CalculadoraApp(),
        '/conversor-temperatura': (context) => TemperaturaApp(),
        '/lista-telefonica': (context) => const ListaTelefonica(),
        '/cadastro-pessoa': (context) => CadastroPessoaApp(),

        '/salvar-pessoa-local': (context) => const SalvarPessoaLocalScreen(),
        '/form-pessoa': (context) => const FormPessoaScreen(),
        '/listar-pessoas': (context) => const ListarPessoasScreen(),
      },
    );
  }
}


