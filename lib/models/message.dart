import 'package:circle_main/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id;
  String conversationId;
  String senderId;

  String messageType;
  String? message;
  bool isSeen;
  DateTime createdAt;
  String? recording;
  String? imgPath;
  Blob? file;

  Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.messageType,
    this.message,
    required this.isSeen,
    required this.createdAt,
    this.recording,
    this.imgPath,
    this.file,
  });

// receiving data from server
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      conversationId: json['conversationId'],
      senderId: json['senderId'],
      messageType: json['messageType'],
      message: json['message'],
      isSeen: json['isSeen'],
      createdAt: Utils.toDateTime(json['createdAt']),
      recording: json['recording'],
      imgPath: json['imgPath'],
      file: json['file'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversationId': conversationId,
      'senderId': senderId,
      'messageType': messageType,
      'message': message,
      'isSeen': isSeen,
      'createdAt': Utils.fromDateTimeToJson(createdAt),
      'recording': recording,
      'imgPath': imgPath,
      'file': file
    };
  }

  factory Message.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc, String? uid) {
    return Message(
      id: doc.data()?['id'],
      conversationId: doc.data()?['conversationId'],
      senderId: doc.data()?['senderId'],
      messageType: doc.data()?['messageType'],
      message: doc.data()?['message'],
      isSeen: doc.data()?['isSeen'],
      createdAt: doc.data()?['createdAt'],
      recording: doc.data()?['recording'],
      imgPath: doc.data()?['imgPath'],
      file: doc.data()?['file'],
    );
  }
}

// List<Message> messages = [];
