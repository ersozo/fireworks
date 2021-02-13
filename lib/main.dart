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

  kullaniciEkle() {
    db
        .collection('kullanicilar')
        .add(
          {
            'isim': 'Hakan',
            'soyad': 'Demir',
            'mail': 'hdemir@mail.com',
            'avatar':
                'https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508__340.jpg',
          },
        )
        .then((makbuz) => print(makbuz.documentID))
        .catchError((hata) => print('kullanici eklenemedi: $hata'));
  }

  kimlikIlekullaniciEkle() {
    db
        .collection('kullanicilar')
        .document('abc')
        .setData(
          {
            'isim': 'Hakan',
            'soyad': 'Demir',
            'mail': 'hdemir@mail.com',
            'avatar':
                'https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508__340.jpg',
          },
        )
        .then((_) => print('dokuman girildi'))
        .catchError((hata) => print('kullanici eklenemedi: $hata'));
  }

  kullaniciGuncelle() {
    db
        .collection('kullanicilar')
        .document('abc')
        .updateData(
          {
            'isim': 'Zeynep',
            'soyad': 'Erin',
            'mail': 'zerin@mail.com',
            'avatar':
                'https://cdn.pixabay.com/photo/2014/09/17/20/03/profile-449912_960_720.jpg',
          },
        )
        .then((_) => print('dokuman guncellendi'))
        .catchError((hata) => print('hata olustu: $hata'));
  }

  kullaniciSil() {
    db
        .collection('kullanicilar')
        .document('0OSwRFoVGejlfeCsEBS8')
        .delete()
        .then((_) => print('dokuman guncellendi'))
        .catchError((hata) => print('hata olustu: $hata'));
  }

  @override
  void initState() {
    super.initState();
    kullaniciSil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('kullanicilar').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<Kullanici> kullanicilar = snapshot.data.documents
              .map((DocumentSnapshot doc) => Kullanici.dokumandanUret(doc))
              .toList();

          return ListView.builder(
            itemCount: kullanicilar.length,
            itemBuilder: (context, pozisyon) {
              return ListTile(
                title: Text(kullanicilar[pozisyon].isim),
                subtitle: Text(kullanicilar[pozisyon].eposta),
                leading: Image.network(kullanicilar[pozisyon].avatar),
              );
            },
          );
        },
      ),
    );
  }
}
