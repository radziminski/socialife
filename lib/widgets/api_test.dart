import 'package:flutter/material.dart';
import 'package:socialife/services/user/api/get_me.request.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  String email = 'loading';
  String firstName = 'loading';

  @override
  void initState() {
    super.initState();
    getMe().then((user) {
      setState(() {
        email = user.email;
        firstName = user.profile?.firstName ?? 'unknown';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(email),
      Text(firstName),
    ]);
  }
}
