import 'package:flutter/material.dart';

class KidCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? status;
  final VoidCallback onTap;
  final Widget? action;
  final EdgeInsets? edgeInsets;

  const KidCard({
    Key? key,
    required this.title,
    required this.onTap,
    this.status,
    this.subtitle,
    this.edgeInsets,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomPaddingTitle = (action != null) ? 11 : 0;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: edgeInsets ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff4D5DFA).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (status != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: status,
              ),
            Padding(
              padding: EdgeInsets.only(
                bottom: bottomPaddingTitle.toDouble(),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xff03314B),
                ),
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff03314B),
                  ),
                ),
              ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
