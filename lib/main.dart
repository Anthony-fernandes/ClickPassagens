// @dart=2.9

import 'package:clickpassagensg/Screens/BoasVindas_Screen.dart';
import 'package:clickpassagensg/models/User_model.dart';
import 'package:clickpassagensg/ticket_bloc/ticketBloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ticketBloc(),
        )
      ],
      child: ClickPassagens()));
}

class ClickPassagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          localizationsDelegates: [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('pt', 'BR')
          ],
          home: BoasVindas_Screen(),
        )
    );
  }
}  

