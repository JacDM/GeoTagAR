import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/discoverPages/group_services.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/text_Field.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

// Comments to be added

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupDescriptionController =
      TextEditingController();
  final TextEditingController _moderatorUsernameController =
      TextEditingController();
  final List<String> _moderators = [];
  File? _groupAvatar;
  File? _groupBanner;
  final GroupServices _groupServices = GroupServices();

  Future<void> _pickImage(ImageSource source, bool isAvatar) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        if (isAvatar) {
          _groupAvatar = File(pickedFile.path);
        } else {
          _groupBanner = File(pickedFile.path);
        }
      });
    }
  }

  void _createGroup() async {
    if (_groupAvatar != null &&
        _groupBanner != null &&
        _groupNameController.text.isNotEmpty &&
        _groupDescriptionController.text.isNotEmpty) {
      await _groupServices.createGroup(
        groupName: _groupNameController.text,
        groupDescription: _groupDescriptionController.text,
        groupAvatar: _groupAvatar!,
        groupBanner: _groupBanner!,
        moderators: _moderators,
      );
      // Check if(mounted) stuff
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Please fill in all required fields and upload images.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Group'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _createGroup,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextField(
              controller: _groupNameController,
              hintText: 'Group Name',
              obscure: false,
            ),
            const SizedBox(height: 16),
            ReusableTextField(
              controller: _groupDescriptionController,
              hintText: 'Group Description',
              obscure: false,
            ),
            const SizedBox(height: 16),
            const Text('Group Picture:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () => _pickImage(ImageSource.gallery, true),
                ),
                if (_groupAvatar != null) Image.file(_groupAvatar!, height: 60),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Group Banner:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () => _pickImage(ImageSource.gallery, false),
                ),
                if (_groupBanner != null) Image.file(_groupBanner!, height: 60),
              ],
            ),
            const SizedBox(height: 16),
            ReusableTextField(
              controller: _moderatorUsernameController,
              hintText: 'Add Moderator by Username',
              obscure: false,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _moderators.add(value);
                    _moderatorUsernameController.clear();
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            const Text('Moderators:'),
            Wrap(
              spacing: 8,
              children: _moderators
                  .map(
                    (moderator) => Chip(
                      label: Text(moderator),
                      onDeleted: () {
                        setState(() {
                          _moderators.remove(moderator);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
