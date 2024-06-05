import 'dart:ffi';

import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../constant/color.dart';
import '../widget/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

  class _HomeState extends State<Home> {
    final todosList = ToDo.todoList();
    List<ToDo> _foundToDo = [];
    final _todocontroller = TextEditingController();
  
  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
              ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for ( ToDo todoo in _foundToDo.reversed )
                      ToDoItem(
                        todo: todoo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                      ),
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                        color: grey, 
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: InputDecoration(
                        hintText: 'Tambahkan Tugas Baru',
                        border: InputBorder.none
                      ),
                    ),
                    )
                    )
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        ),
                        child: ElevatedButton(
                          child: Text('+', style: TextStyle(fontSize: 40,),),
                          onPressed: () {
                            _addToDoItem(_todocontroller.text);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: blue,
                            minimumSize: Size(60, 60),
                            elevation: 10,
                          ),
                        ),
                    )
            ],),
          )
        ],
      ),
    );
  }

  Void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
      });
  }

  void _addToDoItem(String toDO){
    setState(() {
    todoList.add (ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    });
    _todocontroller.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty) {
      results = todosList;
    } else{
      results = todosList
      .where((item) => item.todoText!
      .toLowerCase()
      .contains(enteredKeyword.toLowerCase()))
      .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration:BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icon.search,
              color: black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'seacrh',
            hintStyle: TextStyle(
              color: grey,
            )),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: black,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('asset/OIG1.jpg'),
              ),
            )
          ],
        ));
  }
}