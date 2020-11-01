import 'package:estudo_getx/modules/home/controller/home_controller.dart';
import 'package:estudo_getx/modules/home/view/creat_edit_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;

  const HomePage(this._controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(_controller);
    return Scaffold(
      appBar: AppBar(
        title: Text('Infiti Scroll'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/createdit');
            },
          ),
          PopupMenuButton(
            initialValue: _controller.limit,
            //  onSelected: (value) => _controller.changeTotalPerPage(value),
            itemBuilder: (BuildContext context) {
              return [
                CheckedPopupMenuItem(
                  value: 15,
                  checked: _controller.limit == 15,
                  child: Text('15 por pagina'),
                ),
                CheckedPopupMenuItem(
                  value: 20,
                  checked: _controller.limit == 20,
                  child: Text('20 por pagina'),
                ),
                CheckedPopupMenuItem(
                  value: 50,
                  checked: _controller.limit == 50,
                  child: Text('50 por pagina'),
                ),
              ];
            },
          )
        ],
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: () => _controller.nextPage(),
          isLoading: _controller.lastPage,
          child: ListView.builder(
            itemCount: _controller.users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = _controller.users[index];

              ///   final item = _controller.users[index].id.toString();
              return /* Dismissible(
                key: Key(item),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  _controller.deleteUser(_controller.users[index].id);

                  Get.showSnackbar(GetBar(
                    title: "$item foi removido",
                  ));
                },
                background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment(-0.9, 0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                child: */
                  ListTile(
                onLongPress: () {
                  _controller.deleteUser(_controller.users[index].id);
                },
                onTap: () {
                  Get.toNamed('/createdit', arguments: user);
                },
                leading: Text(user.id),
                title: Text(user.name),
                subtitle: Text(user.username),
                //  ),
              );
            },
          ),
        ),
      ),
    );
  }
}
