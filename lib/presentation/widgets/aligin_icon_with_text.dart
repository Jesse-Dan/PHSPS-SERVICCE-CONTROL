import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlignIconWithTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const AlignIconWithTextWidget({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor = Colors.blue,
    this.textColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: text.length.toDouble(),
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.dmSans(
              color: textColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}

class CurvyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function()? onTap;

  const CurvyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: Colors.blue,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(subtitle),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ),
      ),
    );
  }
}
