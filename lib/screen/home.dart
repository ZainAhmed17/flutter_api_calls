// ignore_for_file: unused_import, depend_on_referenced_packages, avoid_web_libraries_in_flutter, avoid_print, unused_local_variable

import 'dart:convert';
import 'package:api_calls/model/users.dart';
import 'package:api_calls/services/user_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/user_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API calls"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final email = user.email;
          final gender = user.email;
          //final imageurl = user['picture']['thumbnail'];
          return ListTile(
            //leading: ClipRRect(
            //borderRadius: BorderRadius.circular(100),
            //child: Image.network(imageurl)),
            title: Text(user.fullName),
            subtitle: Text(user.location.country),
            tileColor: user.gender == 'male' ? Colors.blue : Colors.green,
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        backgroundColor: Colors.red,
        child: const Icon(Icons.person_search),
      ),*/
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
