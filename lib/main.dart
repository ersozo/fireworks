import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(
      ),
    );
  }
}


class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  void kullanicilariGetir() async {

    var snapsahot = await Firestore.instance.collection('kullanicilar').getDocuments();
    snapsahot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  @override
  void initState() { 
    super.initState();
    kullanicilariGetir();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}