import 'package:estudo_getx/modules/home/controller/creat_edit_controller.dart';
import 'package:estudo_getx/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatEditUser extends StatelessWidget {
  final CreatEditController _controller;
  final HomePage homePage;

  CreatEditUser(this._controller, this.homePage, {Key key}) : super(key: key);

  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              print(_nameController);
              _controller
                  .addUser(_nameController.text, _userNameController.text)
                  .then((value) => Get.toNamed('/'));
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
