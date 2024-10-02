import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/firebase/database/database_references.dart';
import '../db/models/note_entity.dart';

class NotesFirebaseService {
  final _ref = FirebaseDatabase.instance.ref(DatabaseReferences.notes);

  Future insertNote(String userId, NoteEntity entity) async {
    // final id = entity.id;
    return _ref.child(userId).child(entity.id).set(entity.toFirebaseJson());
    // return id;


    // final newPastKey = _ref.push().key;
    //
    // final Map<String, Map> updates = {};
    // updates['/$newPastKey'] = entity.toJson();
    //
    // await _ref.update(updates);
    // return newPastKey;
  }

  Future<List<NoteEntity>> getNotes(String userId) async {
    final dataSnapshot = await _ref.child(userId).get();
    debugPrint('NOtesFirebaseService -> getNotes -> dataSnapshot: $dataSnapshot');
    final dynamic maps = dataSnapshot.children.map((e) {
      final key = (e.key as String);
      final value = e.value as Map<dynamic, dynamic>;
      debugPrint('NotesFirebaseService -> getNotes -> key: $key, value: $value');
      return NoteEntity.fromFirebaseJson(key, value);
    }).toList();
    debugPrint('NotesFirebaseService -> getNotes-> maps: $maps');
    return maps;
  }
//
// Future<NoteEntity?> getNoteById(int id) async {
//   final db = await _notesDatabase.database;
//   final List<Map<String, dynamic>> maps = await db.query(tableName, where: '$columnId = ?', whereArgs: [id]);
//   return maps.isNotEmpty ? NoteEntity.fromJson(maps[0]) : null;
// }
//
Future deleteNote(String userId, String noteId) async{
  return _ref.child(userId).child(noteId).remove();
}
}
