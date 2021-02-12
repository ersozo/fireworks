import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireworks/models/kullanici.dart';

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
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final db = Firestore.instance;

  void kullanicilariGetir() async {
    var snapsahot = await db.collection('kullanicilar').getDocuments();
    snapsahot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kimlikIlekullanicilariGetir() async {
    var doc = await db
        .collection('kullanicilar')
        .document('PZXOLai7rQn5vK6iNzmp')
        .get();

    if (doc.exists) {
      print(doc.data['isim']);
    } else {
      print('böyle bir doküman bulunmuyor...');
    }
  }

  void kullanicilariSirala() async {
    var snapsahot = await db
        .collection('kullanicilar')
        .orderBy('yaş', descending: true)
        .getDocuments();
    snapsahot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullanicilariSorgula() async {
    var snapsahot = await db
        .collection('kullanicilar')
        .where('yaş', isLessThanOrEqualTo: 60)
        .getDocuments();
    snapsahot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullaniciCokluSorgu() async {
    QuerySnapshot snapsahot = await db
        .collection('kullanicilar')
        .where('soyad', isEqualTo: 'Kaya')
        .where('yaş', isGreaterThan: 25)
        .limit(1)
        .getDocuments();
    snapsahot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
    });
  }

  void kullaniciOlustur() async {
    var doc = await db
        .collection('kullanicilar')
        .document('PZXOLai7rQn5vK6iNzmp')
        .get();

    Kullanici kullanici_1 = Kullanici.dokumandanUret(doc);

    print(kullanici_1.id);
    print(kullanici_1.isim);
    print(kullanici_1.soyad);
    print(kullanici_1.avatar);
    print(kullanici_1.eposta);
  }

  @override
  void initState() {
    super.initState();
    kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

