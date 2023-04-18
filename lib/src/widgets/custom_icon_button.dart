// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(2.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return Padding(
      padding: margin,
      child: !kIsWeb &&
              (platform == TargetPlatform.iOS ||
                  platform == TargetPlatform.macOS)
          ? Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCED3DE).withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: CupertinoButton(
                onPressed: onTap,
                child: icon,
              ),
          )
          : InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCED3DE).withOpacity(0.5), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(5.0),
                child: icon,
              ),
            ),
    );
  }
}
