import 'package:clickpassagensg/Home.dart';
import 'package:clickpassagensg/Screens/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoasVindas_Screen extends StatefulWidget {
  const BoasVindas_Screen({Key? key}) : super(key: key);

  @override
  _BoasVindas_ScreenState createState() => _BoasVindas_ScreenState();
}

class _BoasVindas_ScreenState extends State<BoasVindas_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(new Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(),
        ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 10, 19, 100)
        ),
        child: Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('Image/click.png'),
            )
        )
    );
  }

}
