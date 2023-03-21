import 'package:flutter/material.dart';

class ReportDialog extends StatefulWidget {
  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  List<String> selectedReasons = [];

  @override
  Widget build(BuildContext context) {
    List<String> reasons = [
      'Inappropriate content',
      'Spam or misleading',
      'Hate speech or symbols',
      'Violence or dangerous organizations',
      'Intellectual property violation',
      'Other',
    ];

    return AlertDialog(
      title: Text("Report Post"),
      content: SingleChildScrollView(
        child: Column(
          children: reasons.map((reason) {
            return CheckboxListTile(
              title: Text(reason),
              value: selectedReasons.contains(reason),
              onChanged: (value) {
                setState(() {
                  if (value != null && value) {
                    selectedReasons.add(reason);
                  } else {
                    selectedReasons.remove(reason);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            Navigator.of(context).pop(selectedReasons);
          },
        ),
      ],
    );
  }
}
