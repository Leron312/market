void main() {
  Map<String, dynamic> myMap = {
    "name": "Alex",
    "age": 35,
    "course": 2,
    "single": true,
    "description": [
      "Мечтатель",
      "Ленив",
      "Студент",
      "Постоянно жалуется на жизнь"
    ]
  };
  var {'name': name, 'age' : age, 'description' : description} = myMap;
  print('name: $name, age: $age, description $description');

  callTask2();
  callTask3();
}

void callTask2() {
  var person = {
    "nickname": "Alex",
    "age": 35,
    "course": 2,
    "ids": [
      1, 5
    ]
  };
  var {'ids' : $ids, 'course' : $course, 'nickname' : $nickname} = person;
  print(person);
}

void callTask3() {
  var myMap2 =
  [
    {
      "name": "tt",
      "type": "file",
      "paths": [
        "tt.json",
        "tt.js",
        "c:/documents/tt.json",
      ]
    },
    {
      "name": "Object",
      "type": "executable",
      "paths": [
        "c:/documents/Object.exe",
        "c:/documents/Object"
      ]
    }
  ];
  var [{'paths' : $paths, 'type' : $type}, {'paths' : $paths1, 'type' : $type1}] = myMap2;
  print(" ");
  print(myMap2);
}

