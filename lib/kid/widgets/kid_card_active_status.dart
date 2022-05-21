import 'package:flutter/material.dart';

class KidCardActiveStatus extends StatelessWidget {
  final ActiveStatus activeStatus;

  const KidCardActiveStatus({
    required this.activeStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      activeStatus == ActiveStatus.active ? "Сейчас идет" : "Воспоминания",
      style: const TextStyle(
        color: Color(0xffE6492D),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

enum ActiveStatus {
  active,
}
