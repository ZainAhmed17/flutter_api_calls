// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:api_calls/model/user_dob.dart';
import 'package:api_calls/model/user_location.dart';
import 'package:api_calls/model/users.dart';
import 'package:http/http.dart' as http;

import '../model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers Called');
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          first: e['name']['first'],
          last: e['name']['last'],
          title: e['name']['title']);
      final date = e['dob']['date'];

      final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));

      final coordinates = LocationCoordinates(
          lattitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']);

      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']);

      final timezone = LocationTimezoneCoordinates(
          offset: e['location']['timezone']['offset'],
          desc: e['location']['timezone']['description']);

      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        postcode: e['location']['postcode'].toString(),
        country: e['location']['country'],
        coordinates: coordinates,
        street: street,
        timezone: timezone,
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
        coordinates: coordinates,
        street: street,
        timezone: timezone,
      );
    }).toList();
    return users;
    //print('fetched users completed');
  }
}
