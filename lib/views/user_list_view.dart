import 'package:flutter/material.dart';
import 'package:project/models/user.dart';
import 'package:project/services/user_service.dart';
import 'package:project/views/user_detail_view.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserService userService = UserService();
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      final fetchedUsers = await userService.findAll();
      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
      print('Erro ao buscar usuários: $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.username),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            child: Text(user.username[0].toUpperCase()),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailView(userId: user.id),
              ),
            );
          },
        );
      },
    );
  }
}
