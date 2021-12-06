import 'package:clickpassagensg/Screens/Login_Screen.dart';
import 'package:clickpassagensg/models/User_model.dart';
import 'package:clickpassagensg/service/Service_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Perfil_Screen extends StatefulWidget {
  const Perfil_Screen({Key? key}) : super(key: key);

  @override
  _Perfil_ScreenState createState() => _Perfil_ScreenState();
}

class _Perfil_ScreenState extends State<Perfil_Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return SliverAppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      print(model.verification());
                      if(!model.verification())
                        setState(() {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login_Screen()));
                        });
                      else{
                        model.singOut();
                      }
                    },
                    child: Text(!model.verification() ? "Entre"
                        : "sair",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
              ],
              backgroundColor: Color.fromARGB(255, 10, 19, 100),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                    height: MediaQuery.of(context).size.width / 4.5,
                    child: !model.verification() ?
                    Container(
                      width: 70.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('Image/iconPerfil.png')
                        ),
                      ),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 70.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('Image/iconPerfil.png')
                            ),
                          ),
                        ),
                        Text( " ${model.userData["name"]}",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Container(width: 20,),
                        IconButton(onPressed: () {}, icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                          size: 10,
                        ),)
                      ],
                    )
                ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Image/tema.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.width / 2,
            );
          }),
      SliverList(
          delegate: SliverChildListDelegate([
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                ScopedModelDescendant<UserModel>(
                    builder: (context, child, model){
                      return CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.only(left: 30),
                          child: ListTile(
                            leading: Icon(
                              Icons.confirmation_number_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Torna-se prestador de serviços',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            if(model.verification()){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Service_Screen()));
                            }else{
                              null;
                            }
                          });
                    }),
                SizedBox(
                  height: 40,
                ),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    padding: EdgeInsets.only(left: 30),
                    color: Colors.white12,
                    child: ListTile(
                      leading: Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Termos de serviços',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {}),
                SizedBox(
                  height: 40,
                ),
              ],
            )
          ],
        )
      ]))
    ]));
  }
}
