import 'package:clickpassagensg/Screens/Cadastro_Screen.dart';
import 'package:clickpassagensg/models/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Home.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Login_Screen> {

  final _emailControler = TextEditingController();
  final _passControler = TextEditingController();

  final _FormKey = GlobalKey<FormState>();
  final _ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Image/tema.png'),
                  fit: BoxFit.cover
              )
          ),
        child:
        ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
                key: _FormKey,
                child:
                ListView(
                  padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/6,
                      child: Image.asset('Image/click.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailControler,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          ),

                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      validator: (text) {
                        if( text!.isEmpty || !text.contains('@')) return "E-mail inválido";
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passControler,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                          ),
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      obscureText: true,
                      validator: (text){
                        if(text!.isEmpty || text.length < 6) return "E-mail inválido!";
                      },
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {},
                            child: Text('Esqueceu sua senha?', style: TextStyle(color: Colors.white),))
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                        color: Colors.white,
                        child: Text('Entrar', style: TextStyle(color: Colors.blueAccent),),
                        onPressed: () {
                          if(_FormKey.currentState!.validate()){
                            model.signIn(
                                email: _emailControler.text,
                                password: _passControler.text,
                                Success: _Success,
                                Fail: _Fail);
                          }
                        }
                    ),
                    SizedBox(
                        height: 30
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Não tem uma conta?", style: TextStyle(color: Colors.black),),
                        TextButton(onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Cadastro_Screen()));
                        },
                            child: Text('Cadastre-se', style: TextStyle(color: Colors.white),))
                      ],
                    )
                  ],
                )
            );
          },
        )
      )
    );
  }


  void _Fail() {
    _ScaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text("Falha ao executar o login"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        )
    );
  }

  void _Success() {
    Navigator.of(context).pop();
  }
}