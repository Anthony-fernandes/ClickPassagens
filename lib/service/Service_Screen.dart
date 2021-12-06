import 'package:clickpassagensg/Home.dart';
import 'package:clickpassagensg/Screens/ticket_page.dart';
import 'package:clickpassagensg/models/Documentos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service_Screen extends StatefulWidget {
  const Service_Screen({Key? key}) : super(key: key);

  @override
  _Service_ScreenState createState() => _Service_ScreenState();
}

class _Service_ScreenState extends State<Service_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 19, 100),

        title:Text('Formulario de Serviço')
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Upload dos seus documentos pessoais', style: TextStyle(color: Colors.black),),

                CupertinoButton(
                  borderRadius: BorderRadius.circular(30),
                  padding: EdgeInsets.only(left: 30),
                  color: Colors.white12,
                  child: ListTile(
                    leading: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      'CNH(Carteira Nacional de Habilitação)',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DocumentosPage(), fullscreenDialog: true)
                    );
                  }),

                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    padding: EdgeInsets.only(left: 30),
                    color: Colors.white12,
                    child: ListTile(
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'RG(Registro Geral)',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DocumentosPage(), fullscreenDialog: true)
                      );
                    }),
                Text('Upload dos documentos do veiculo', style: TextStyle(color: Colors.black, fontSize: 15),),

                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    padding: EdgeInsets.only(left: 30),
                    color: Colors.white12,
                    child: ListTile(
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'CRLV(Certificado de Registro e Licenciamento do Veículo)',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DocumentosPage(), fullscreenDialog: true)
                      );
                    }),

                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    padding: EdgeInsets.only(left: 30),
                    color: Colors.white12,
                    child: ListTile(
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'CRV(Certificado de Registro de Veículo)',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DocumentosPage(), fullscreenDialog: true)
                      );
                    }),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 10, 19, 100),
                    child: Text(
                        'Concluir',
                        style: TextStyle(color: Colors.white),
                      ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ticket_page(), fullscreenDialog: true)
                      );
                    }),
              ],
            )
        ),
    );
  }
}
