import 'package:cloud_firestore/cloud_firestore.dart';

class User_ {
  String? id;
  String? name;
  String? subtitle;
  String? email;
  String? phonenumber;
  String? dateTime;
  DateTime? creationTime;
  String? gender;
  String? photoUrl;
  bool isSelect;

  User_({
    this.id,
    this.name,
    this.subtitle = "",
    this.email,
    this.phonenumber,
    this.dateTime,
    this.creationTime,
    this.gender,
    this.photoUrl,
    this.isSelect = false,
  });

  // receiving data from server
  factory User_.fromMap(map) {
    return User_(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phonenumber: map['phone number'],
      dateTime: map['dob'],
      gender: map['gender'],
      photoUrl: map['photoUrl'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'name': name,
      'email': email,
      'phone number': phonenumber,
      'dob': dateTime,
      'gender': gender,
      'photoUrl': photoUrl,
    };
  }

  factory User_.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc, String? uid) {
    return User_(
      id: uid,
      name: doc.data()?['name'],
      email: doc.data()?['email'],
      phonenumber: doc.data()?['phone number'],
      dateTime: doc.data()?['dob'],
      gender: doc.data()?['gender'],
      photoUrl: doc.data()?['photoUrl'],
    );
  }
}

List<User_> notifyUser = [];

final List<User_> chatData = [
  User_(
      id: '1',
      name: "zainab",
      subtitle: '',
      email: 'zainab@gmail.com',
      phonenumber: '03214134555',
      dateTime: DateTime.now().toString(),
      creationTime: DateTime.now(),
      gender: "",
      photoUrl:
          'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      isSelect: false),
  User_(
      id: '2',
      name: "naba",
      subtitle: '',
      email: 'naba@gmail.com',
      phonenumber: '0322334555',
      dateTime: DateTime.now().toString(),
      creationTime: DateTime.now(),
      gender: "",
      photoUrl: 'https://picsum.photos/seed/picsum/200/300',
      isSelect: false),
  User_(
      id: '3',
      name: "nouman",
      subtitle: '',
      email: 'nouman@gmail.com',
      phonenumber: '03215534555',
      dateTime: DateTime.now().toString(),
      creationTime: DateTime.now(),
      gender: "",
      photoUrl: "https://picsum.photos/200/300/?blur",
      isSelect: false),
  User_(
      id: '4',
      name: "maryam",
      subtitle: '',
      email: 'maryam@gmail.com',
      phonenumber: '03214134455',
      dateTime: DateTime.now().toString(),
      creationTime: DateTime.now(),
      gender: "",
      photoUrl: "https://picsum.photos/200/300.jpg",
      isSelect: false),
];

List<User_> oppositeUser = [
  User_(
    id: "djasdjks dkas",
    name: 'Maryam',
    // isActive: true,
    // profilePicture_: imgList[1],
  ),
];

User_ currentUser_ = User_(
  id: "1",
  name: 'Mujab',
  email: 'mujabkhan77@gmail.com',
  phonenumber: '03354141784',
);
// class User_ {
//   int? id;
//   String? name_;
//   String? email_;
//   String? phoneNumber;
//   String? username;
//   //String? profilePicture_;

//   // String email;
//   // bool isActive;
//   // DateTime createdAt;
//   // DateTime updatedAt;

//   User_({
//      this.id,
//      this.name_,
//      this.email_,
//      this.phoneNumber,
//      this.username,
//     // this.password_,
//     // this.phoneNumber,
//     // this.profilePicture_,
//     // this.email,
//     // this.isActive,
//     // this.createdAt,
//     // this.updatedAt,
// });
//    //data from server
//     factory User_.fromMap(map) {
//     return User_(
//       id: map['id'],
//       name_:map['name'],
//       email_: map['email'],
//       phoneNumber: map['phone number'],
//       username: map['username']
//     );
//   }
//   //sending data to server
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'email': email_,
//       'name': name_,
//       'phone number': phoneNumber,
//     };
//   }

//   // void changeProfilePicture(String newPath) {
//   //   this.profilePicture_ = newPath;
//   //   this.updatedAt = DateTime.now();
//   // }

//   // void changeUserName(String newName) {
//   //   this.name_ = newName;
//   // }

//   // void changePassword(String newPassword) {
//   //   this.password_ = newPassword;
//   // }

//   // void changeNumber(String number) {
//   //   this.phoneNumber = number;
//   // }

//   // void changeEmail(String email) {
//   //   this.email = email;
//   // }

//   // void changeCreatedAt(DateTime dateTime) {
//   //   this.createdAt = dateTime;
//   // }
// }

late User_ signUpUser;
// List<User_> users = [];
// User_ currentUser = User_(
//   id: 2,
//   // isActive: true,
//   name: 'Mujab',
//   phonenumber: "12345678901",
//    email: "mujabkhan77@gmail.com");

// List<User_> oppositeUser = [
//   User_(
//     id: 1,
//     name: 'Maryam',
//     phonenumber: "12345678901",
//    email: "mujabkhan77@gmail.com"

//     // isActive: true,
//     // profilePicture_: imgList[1],
//   ),
// ];
