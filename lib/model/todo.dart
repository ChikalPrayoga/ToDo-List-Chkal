class ToDo {
  final String id;
  final String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  /// Menghasilkan daftar contoh item To-Do.
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Belajar koding', isDone: true),
      ToDo(id: '02', todoText: 'Makan', isDone: true),
      ToDo(id: '03', todoText: 'Tidur'),
      ToDo(id: '04', todoText: 'Mandi'),
      ToDo(id: '05', todoText: 'Push Rank'),
    ];
  }
}