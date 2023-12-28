import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isNotificationSelected = true; // State variable to track selection

  void toggleSelection(bool isNotification) {
    setState(() {
      isNotificationSelected = isNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => toggleSelection(true),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6),
                          child: ToggleOption(
                            text: 'Notifications',
                            isSelected: isNotificationSelected,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => toggleSelection(false),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleOption(
                            text: 'Chat',
                            isSelected: !isNotificationSelected,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateHeader('Today'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Mark as read',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            _buildNotificationItem(
              title: 'Aza Fashions upload new items',
              subtitle: 'Check it now >',
              time: '16:22',
              isNew: true,
            ),
            // Add other notification items...
            _buildDateHeader('Yesterday'),
          ],
        ));
  }

  Widget _buildToggleOption(String title, bool isSelected) {
    return FilterChip(
      label: Text(title),
      selected: isSelected,
      onSelected: (bool value) {},
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String time,
    required bool isNew,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red, // Placeholder for icon or image
        child: Text('AF'),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isNew
              ? Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                )
              : SizedBox.shrink(),
          Text(time),
        ],
      ),
      onTap: () {
        // Handle notification tap
      },
    );
  }
}

class ToggleOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ToggleOption({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(3, 3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            )
          : null,
      child: Text(
        text,
        style: TextStyle(
          fontSize:
              isSelected ? 16 : 14, // Slightly larger font for selected option
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}
