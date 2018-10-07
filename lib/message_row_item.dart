import 'dart:core';

import 'package:flutter/material.dart';

class MessageRow extends StatelessWidget {
  final String message;
  final String user;

  MessageRow(this.user, this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                child: new Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    user,
                  ),
                ),
              ),
              Text(
                message,
              ),
            ],
          ),
        ),
        Icon(
          Icons.access_time,
        ),
      ],
    );
  }

}