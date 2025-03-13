class TodoModel {
  String title;
  String description;
  bool isDone;

  String? uid;
  String? docId;

  TodoModel(
    this.title, 
    this.description, 
    this.isDone ,
{
   this.docId,
   this.uid,
}
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'uid': uid,
      'docId': docId,
    };
  }

  TodoModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      description = json['description'],
      isDone = json['isDone'],
      uid = json['uid'],
      docId = json['docId'];
}
