import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperatura App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String temperatura = '';

  void _getTemperatura(String cidade) async {
    final uri = Uri.parse('http://localhost:3000/temperatura/$cidade');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperatura =
            'Temperatura em ${data['cidade']}: ${data['temperatura']}°C';
      });
    } else {
      setState(() {
        temperatura = 'Erro ao obter temperatura.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperatura App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Digite o nome da cidade'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _getTemperatura(_controller.text);
              },
              child: Text('Obter Temperatura'),
            ),
            SizedBox(height: 16.0),
            Text(
              temperatura,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
