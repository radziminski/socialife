import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';

class UserGravatar extends StatelessWidget {
  final String? email;
  final double size;
  const UserGravatar({
    Key? key,
    required this.email,
    this.size = 34,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Gravatar gravatar = Gravatar(email ?? 'test@test.com');

    return ClipRRect(
      borderRadius: BorderRadius.circular(10000),
      child: Image.network(
        gravatar.imageUrl(),
        width: size,
        height: size,
      ),
    );
  }
}
