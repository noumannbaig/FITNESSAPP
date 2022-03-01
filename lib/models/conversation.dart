class Conversation {
  String? convId;
  String? creatorId;
  String? title;
  String? profilePicture;
  String? lastMessage;
  List<String>? participants;
  DateTime? lastModified;
  DateTime? createdAt;
  bool isSeen;
  bool isGroup;
  bool isActive;
  bool select;

  Conversation({
    this.convId,
    this.creatorId,
    this.title,
    this.profilePicture,
    this.lastMessage,
    this.participants,
    this.lastModified,
    this.createdAt,
    this.isSeen = false,
    this.isGroup = false,
    this.isActive = false,
    this.select = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "convId": convId,
      "creatorId": creatorId,
      "title": title,
      "profilePicture": profilePicture,
      "lastMessage": lastMessage,
      "participants": participants,
      "lastModified": lastModified,
      "createdAt": createdAt,
      "isSeen": isSeen,
      "isGroup": isGroup,
      "isActive": isActive
    };
  }
}

List<Conversation> convData = [
  Conversation(
      convId: '1',
      creatorId: '2',
      title: "Zainab",
      profilePicture: "https://picsum.photos/200/300/?blur",
      lastMessage: "text1",
      participants: ['id1'],
      lastModified: DateTime.now(),
      createdAt: DateTime.now(),
      isSeen: true,
      isActive: true),
  // Conversation(
  //   id: 2,
  //   title: "Nouman",
  //   lastMessage: "text1",
  //   profilePicture_: imgList[3],
  //   lastModified: DateTime.now(),
  //   isSeen: true,
  // ),
  // Conversation(
  //   id: 3,
  //   title: "Hassan",
  //   lastMessage: "text1",
  //   profilePicture_: imgList[5],
  //   lastModified: DateTime.now(),
  //   isSeen: true,
  // ),
  // Conversation(
  //   id: 4,
  //   title: "Naba",
  //   lastMessage: "text1",
  //   profilePicture_: imgList[0],
  //   lastModified: DateTime.now(),
  //   isSeen: true,
  // ),
  // Conversation(
  //   id: 5,
  //   title: "Maryam",
  //   lastMessage: "text1",
  //   profilePicture_: imgList[1],
  //   lastModified: DateTime.now(),
  //   isSeen: true,
  // ),
  // Conversation(
  //   id: 4,
  //   title: "Mujab",
  //   lastMessage: "text1",
  //   image: imgList[2],
  //   lastModified: DateTime.now(),
  //   isSeen: true,
  // ),
];
