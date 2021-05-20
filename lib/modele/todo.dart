class Todo {
  int _id = 0;
  String _title = "";
  String _description = "";
  String _date = "";
  int _priority = 0;

  Todo(this._title, this._date, this._priority, this._description);

  Todo.withId(
      this._id, this._title, this._date, this._priority, this._description);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // **********************
  // **********************
  // ***********************
  set title(String newtitle) {
    if (newtitle.length <= 255) {
      _title = newtitle;
    }
  }

  set description(String newdescription) {
    if (newdescription.length <= 255) {
      _description = newdescription;
    }
  }

  set priority(int newpriority) {
    if (newpriority > 0 && newpriority <= 3) {
      _priority = newpriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;
    return map;
  }

  Todo.formObject(dynamic o) {
    this._id = o['id'];
    this._description = o['description'];
    this._title = o['title'];
    this._date = o['date'];
    this._priority = o['priority'];
  }
}
