import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatelessWidget {
  cikisYap(BuildContext context) {
    var _benimAuthServisim =
        Provider.of<BenimAuthServisim>(context, listen: false);
    _benimAuthServisim.cikisYap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => cikisYap(context),
          child: Container(
            width: 200.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                'Cikis Yap',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
