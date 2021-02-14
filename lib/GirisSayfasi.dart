import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatelessWidget {
  anonimGirisYap(BuildContext context) async {
    var _benimAuthServisim = Provider.of<BenimAuthServisim>(context, listen: false);

    Kullanici kullanici = await _benimAuthServisim.anonimGiris();
    // return kullanici.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => anonimGirisYap(context),
          child: Container(
            width: 200.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                'Giris Yap',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
