class Model {
  int id;
  String name;
  String subtitle;
  String profilePicture;
  //dynamic currentTime = DateFormat.jm().format(DateTime.now());
  DateTime now = DateTime.now();
  Model(this.id, this.name, this.subtitle, this.profilePicture, this.now);
}

List imgList = [
  "https://picsum.photos/200/300",
  "https://picsum.photos/250?image=9",
  "https://picsum.photos/seed/picsum/200/300",
  "https://picsum.photos/200/300/?blur",
  "https://picsum.photos/200/300.jpg",
  'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
];
final List<Model> notiList = [
  Model(1, "Maryam", "Sent you a friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(2, "Naba", "Accepted your friend Request",
      "https://picsum.photos/200/300.jpg", DateTime.now()),
  Model(3, "Maryam", "Sent you a friend Request",
      "https://picsum.photos/200/300/?blur", DateTime.now()),
  Model(4, "Noor", "Accepted your friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(
      5,
      "Ayesha",
      "Sent you a friend Request",
      'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      DateTime.now()),
  Model(
      6,
      "Fatima",
      "Sent you a friend Request",
      'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      DateTime.now()),
  Model(7, "Ayesha", "Sent you a friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(8, "Maryam", "Accepted your friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(9, "Naba", "Accepted your friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(10, "Maryam", "Sent you a friend Request",
      "https://picsum.photos/200/300", DateTime.now()),
  Model(11, "Noor", "Accepted your friend Request",
      "https://picsum.photos/200/300", DateTime.now())
];
