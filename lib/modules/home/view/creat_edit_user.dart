import 'package:estudo_getx/models/user_models.dart';
import 'package:estudo_getx/modules/home/controller/creat_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CreatEditUser extends StatelessWidget {
  final CreatEditController _controller;

  CreatEditUser(this._controller, {Key key}) : super(key: key);

  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  UserModel users = Get.arguments ?? UserModel();

  @override
  Widget build(BuildContext context) {
    _nameController.text = users.name;
    _userNameController.text = users.username;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
        title: Text('Novo produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (users.id == null) {
                _controller.addUser(
                    _nameController.text, _userNameController.text);
              } else {
                _controller.updateUser(users.id, users.name, users.username);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                controller: _nameController,
//onChanged: (newValue) => modelItems.nome = newValue,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'User Name'),
                keyboardType: TextInputType.numberWithOptions(),
                textInputAction: TextInputAction.next,
                controller: _userNameController,
//onChanged: (newValue) => modelItems.preco = newValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
