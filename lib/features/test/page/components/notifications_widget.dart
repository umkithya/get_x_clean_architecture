import 'package:flutter/material.dart';

import '../test_page.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: leftPadding,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isOn ? 'On' : 'Off',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Switch(
              value: isOn,
              onChanged: setNotificationsState,
              activeColor: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }

  void setNotificationsState(bool value) {
    setState(() {
      isOn = value;
    });
  }
}
