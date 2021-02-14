
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kullanici {
  final String id;
  final String isim;
  final String soyad;
  final String avatar;
  final String eposta;

  Kullanici({this.id, this.isim, this.soyad, this.avatar, this.eposta});

  factory Kullanici.dokumandanUret(DocumentSnapshot doc) {
    return Kullanici(
      id: doc.documentID,
      isim: doc.data['isim'],
      soyad: doc.data['soyad'],
      avatar: doc.data['avatar'],
      eposta: doc.data['mail'],
    );
  }

  factory Kullanici.firebasedenUret(FirebaseUser kullanici) {
    return Kullanici(
      id: kullanici.uid,
      isim: kullanici.displayName,
      avatar: kullanici.photoUrl,
      eposta: kullanici.email,
    );
  }


}
