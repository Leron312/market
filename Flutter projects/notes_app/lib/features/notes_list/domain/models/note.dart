import 'package:equatable/equatable.dart';

class Note extends Equatable{

  final String title;
  final String content;
  final String id;


  const Note({required this.title, required this.content, required this.id});

  @override
  List<Object?> get props => [title, content, id];
}