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
                margin: new EdgeInsets.only(top: 5.0, left: 15.0),
                child: new Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    user,
                  ),
                ),
              ),
          Container(
              margin: new EdgeInsets.only(left: 15.0),
              child:
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                ),
              ))
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
