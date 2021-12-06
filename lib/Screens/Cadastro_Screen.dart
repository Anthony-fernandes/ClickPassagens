import 'package:clickpassagensg/Screens/Login_Screen.dart';
import 'package:clickpassagensg/models/User_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Cadastro_Screen extends StatefulWidget {
  const Cadastro_Screen({Key? key}) : super(key: key);
  @override
  _Cadastro_ScreenState createState() => _Cadastro_ScreenState();
}

class _Cadastro_ScreenState extends State<Cadastro_Screen> {

  final _FormKey = GlobalKey<FormState>();
  final _ScaffoldKey = GlobalKey<ScaffoldState>();

  final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _telefoneControler = TextEditingController();
  final _passControler = TextEditingController();

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
                  padding: EdgeInsets.only( left: 30, right: 30, top: 30),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/7,
                      child: Image.asset('Image/click.png'),
                    ),
                    TextFormField(
                      controller: _nameControler,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          ),
                          labelText: "Nome completo",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      validator: (text){
                        if(text!.isEmpty) return " Este campo não pode esta vazio";
                      },
                    ),
                    SizedBox(
                      height: 20,
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
                          labelStyle: TextStyle(color: Colors.white)
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
                      controller: _telefoneControler,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          ),
                          labelText: "Telefone",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      validator: (text){
                        if(text!.isEmpty ) return "Telefone inválido!";
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
                              )
                          ),
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      obscureText: true,
                      validator: (text){
                        if(text!.isEmpty || text.length < 6) return "Senha inválido!";
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        color: Colors.white,
                        child: Text('Cadastrar-se',style: TextStyle(color: Colors.blueAccent)),
                        onPressed: () {
                          if(_FormKey.currentState!.validate()){
                            Map<String, dynamic> userData = {
                              "name": _nameControler.text,
                              "email": _emailControler.text,
                              "telefone": _telefoneControler.text,
                            };
                            model.register(
                                userData: userData,
                                password: _passControler.text,
                                Fail: _Fail,
                                Success: _Success
                            );
                          }
                        }
                    ),
                    SizedBox(
                        height: 20
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Já possui uma conta?", style: TextStyle(color: Colors.black),),
                        TextButton(onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login_Screen())
                          );
                        },
                            child: Text('Entrar', style: TextStyle(color: Colors.white)))
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
        SnackBar(content: Text("Falha ao executar o cadastro"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        )
    );
  }

  void _Success() {
    Navigator.of(context).pop();
  }
}
