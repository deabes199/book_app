import 'package:book_app/core/networking/error_model.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewButton extends StatelessWidget {
  final String pdfLink, info;
  const PreviewButton({super.key, required this.pdfLink, required this.info});

  Future<void> _launchUrl(String url) async {
    final Uri _uri = Uri.parse(url);
    if (await canLaunchUrl(_uri)) {
      await launchUrl(_uri);
    } else {
      throw ErrorModel('Could not lanch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: () {
              _launchUrl(info);
            },
            child: const Text('Info',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
        horzintalSpace(12),
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          onPressed: () {
            _launchUrl(pdfLink);
          },
          child: const Text(
            'Preview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ))
      ],
    );
  }
}
