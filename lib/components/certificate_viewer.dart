import 'dart:math';

import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  const CertificateViewer({super.key});

  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  final List<String> _certificatePaths = [
    'assets/certificates/certificate-01.png',
    'assets/certificates/certificate-02.png',
    'assets/certificates/certificate-03.png'
  ];

  late Widget _certificateViewer;

  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];

    _certificatePaths.reversed.toList().asMap().forEach((index, certificate) {
      int angleDegree;
      if (index == certificate.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(10) - 5;
      }

      imageChildren.add(Transform.rotate(
        angle: angleDegree * (pi / 180),
        child: Image.asset(
          certificate,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ));
    });

    _certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: _certificateViewer,
    );
  }
}
