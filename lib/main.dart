// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SimpleInput(),
    );
  }
}

class SimpleInput extends StatelessWidget {
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TASK 4'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namaController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.account_circle_outlined,
                  ),
                  labelText: 'Nama',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nomorController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                  labelText: 'Nomor Telepon',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    // Tombol Navigator ke New Screen
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                namaController.text, nomorController.text)),
                      );
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class Home extends StatefulWidget {
  final String nama;
  final String nomor;
  Home(this.nama, this.nomor);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('Detail')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                ),
                Text('Nama Kontak : ${widget.nama}'),
              ],
            ),
          ),
          // Layar baru
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                ),
                Text('Nomor Telepon : ${widget.nomor}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Kembali'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
