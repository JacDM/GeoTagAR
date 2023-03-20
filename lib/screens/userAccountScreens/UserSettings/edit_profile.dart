import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../services/firestore.dart';
import '../../../utils/text_Field.dart';
import '../reusableWidgets/custom_button.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Widget k_verSpacing = const SizedBox(
  height: 30.0,
);

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> userData;
  const EditProfile({super.key, required this.userData});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool isLoading = false;

  File? _profilePictureFile;
  File? _bannerFile;
  String? _selectedGender;
  String? _selectedAccountType;

  Future<void> _pickProfilePicture() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePictureFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickBanner() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _bannerFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        String? profilePictureUrl;
        String? bannerUrl;

        if (_profilePictureFile != null) {
          profilePictureUrl =
              // Need to update this to firebaseStorageMethods later
              await FireStoreMethods().uploadImageToFirebaseStorage(
            _profilePictureFile!,
            'profilePictures/${FirebaseAuth.instance.currentUser!.uid}',
          );
        }

        if (_bannerFile != null) {
          // Need to update this to firebaseStorageMethods later
          bannerUrl = await FireStoreMethods().uploadImageToFirebaseStorage(
            _bannerFile!,
            'banners/${FirebaseAuth.instance.currentUser!.uid}',
          );
        }

        await FireStoreMethods().updateUserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: _nameController.text.trim(),
          bio: _bioController.text.trim(),
          profilePictureUrl: profilePictureUrl ?? widget.userData['profilePic'],
          bannerUrl: bannerUrl ?? widget.userData['banner'],
          accountType: _selectedAccountType.toString(),
          gender: _selectedGender.toString(),
        );
        // Do the mount thing maybe
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $e')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userData['name'];
    _bioController.text = widget.userData['bio'];
    _selectedGender = widget.userData['gender'];
    _selectedAccountType = widget.userData['accountType'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ReusableTextField(
                        controller: _nameController,
                        hintText: 'Name',
                        obscure: false,
                        textColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      ReusableTextField(
                        controller: _bioController,
                        hintText: 'Bio',
                        obscure: false,
                        textColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a bio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      DropdownButtonFormField<String>(
                        value: _selectedAccountType,
                        decoration: const InputDecoration(
                            labelText: 'Account Type',
                            labelStyle: TextStyle(color: Colors.white)),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedAccountType = newValue;
                          });
                        },
                        dropdownColor: const Color(
                            0xFF121212), // Dark mode background color
                        style: const TextStyle(
                            color: Colors.white), // White text color
                        items: <String>['General', 'Historian', 'Geocacher']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your account type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        dropdownColor: const Color(
                            0xFF121212), // Dark mode background color
                        style: const TextStyle(
                            color: Colors.white), // White text color
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: _pickProfilePicture,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800]),
                        child: const Text('Pick Profile Picture'),
                      ),
                      const SizedBox(height: 10.0),
                      if (_profilePictureFile != null)
                        Image.file(_profilePictureFile!,
                            height: 100, width: 100, fit: BoxFit.cover),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _pickBanner,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800]),
                        child: const Text('Pick Banner'),
                      ),
                      const SizedBox(height: 10.0),
                      if (_bannerFile != null)
                        Image.file(_bannerFile!,
                            height: 100, width: 100, fit: BoxFit.cover),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _saveProfile,
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 35, 149, 255)),
                        child: const Text('Save Profile'),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
