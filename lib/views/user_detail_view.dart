
import 'package:flutter/material.dart';
import 'package:project/models/user.dart';
import 'package:project/services/user_service.dart';



class UserDetailView extends StatefulWidget {
  final int userId;

  const UserDetailView({super.key, required this.userId});

  @override
  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  final userService = UserService();
  User? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final fetchedUser = await userService.findById(widget.userId);
    setState(() {
      user = fetchedUser;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes de ${user?.username ?? ''}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user?.id.toString() ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Username: ${user?.username ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user?.email ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Telefone: ${user?.phone ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Website: ${user?.website ?? ''}', style: TextStyle(fontSize: 18)),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            SizedBox(height: 8),
            Text('Endereço:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Rua: ${user?.address.street ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Suite: ${user?.address.suite ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Cidade: ${user?.address.city ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('CEP: ${user?.address.zipCode ?? ''}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}