import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;

  User? firebaseUser;

  Map<String, dynamic> userData = Map();


  bool isLoading = false;


  void register(
      {required Map<String, dynamic> userData, required String password,
      required VoidCallback Success, required VoidCallback Fail}) {

    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData['email'],
      password: password,
    )
        .then((user) async {
      firebaseUser = user.user;
      await _saveUserData(userData);

      Success();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      Fail();
      isLoading = false;
      notifyListeners();
    });
  }


  void signIn(
      {required String email, required String password,
        required VoidCallback Success, required VoidCallback Fail}) async {

    isLoading = true;
    notifyListeners();


    _auth.signInWithEmailAndPassword(
        email: email,
        password: password).then((value) async {
          firebaseUser = value.user;

          await _loadingUser();

          Success();
          isLoading = false;
          notifyListeners();

    }).catchError((onError){
      Fail();
      isLoading = false;
      notifyListeners();

    });
  }

  void singOut() async{
    firebaseUser = null;
    userData = Map();
    await _auth.signOut();

  }

  bool verification() {
    return firebaseUser != null;
  }


  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.uid)
        .set(userData);
  }

  Future<Null> _loadingUser() async {
    if (firebaseUser == null)
      firebaseUser = await _auth.currentUser!;
    if (firebaseUser != null) {
      if (userData['name'] == null) {
        DocumentSnapshot User = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser!.uid)
            .get();
        userData = User.data() as Map<String, dynamic>;
      }
    }
    notifyListeners();
  }
}
