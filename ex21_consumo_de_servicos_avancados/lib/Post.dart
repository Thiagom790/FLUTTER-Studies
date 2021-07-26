class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  Map toJson() {
    return {
      "userId": this._userId,
      "id": this._id,
      "title": this._title,
      "body": this._body,
    };
  }

  int get userId => this._userId;
  int get id => this._id;
  String get title => this._title;
  String get body => this._body;

  set userId(int userId) {
    this._userId = userId;
  }

  set id(int id) {
    this._id = id;
  }

  set title(String title) {
    this._title = title;
  }

  set body(String body) {
    this._body = body;
  }
}
