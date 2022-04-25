// import 'dart:collection';
// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'user_models.dart';
// import 'package:flutter/cupertino.dart';
// class UserNotifier with ChangeNotifier{
//   List<User> user=[];
//   User? currentuser;

//   UnmodifiableListView <User> get _userdata =>UnmodifiableListView(user);
//   User? get _currentUser=>currentuser;

//   set _userdata(List<User> userinfo)
//   {
//     user=_userdata;
//     notifyListeners();
//   }
//   set _currentuser(User _user){
//     currentuser=_user;
//     notifyListeners();
//   }


// }