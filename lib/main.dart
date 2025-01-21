import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(SignUpForm());
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // Form Fields
  String? fullName, gender, dob, mobile, maritalStatus, email, password;
  File? profileImage;
  File? cvFile;

  // Image Picker
  final ImagePicker _imagePicker = ImagePicker();

  // Save Data Locally
  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName ?? '');
    await prefs.setString('gender', gender ?? '');
    await prefs.setString('dob', dob ?? '');
    await prefs.setString('mobile', mobile ?? '');
    await prefs.setString('maritalStatus', maritalStatus ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('password', password ?? '');
    await prefs.setString('profileImage', profileImage?.path ?? '');
    await prefs.setString('cvFile', cvFile?.path ?? '');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signup data saved successfully!')),
    );
  }

  // Select Profile Image
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  // Select CV File
  Future<void> _pickCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        cvFile = File(result.files.single.path!);
      });
    }
  }

  // Submit Form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _saveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter your full name' : null,
                onSaved: (value) => fullName = value,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) =>
                    DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => gender = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      dob = selectedDate.toIso8601String().split('T').first;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(text: dob),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.length != 10
                    ? 'Please enter a valid 10-digit mobile number'
                    : null,
                onSaved: (value) => mobile = value,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Marital Status'),
                items: ['Single', 'Married']
                    .map((status) =>
                    DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (value) => maritalStatus = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value!.contains('@') ? null : 'Enter a valid email',
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                value!.length < 6 ? 'Password must be at least 6 characters' : null,
                onSaved: (value) => password = value,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: Text('Pick Image from Gallery'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: Text('Pick Image from Camera'),
                  ),
                ],
              ),
              profileImage != null
                  ? Image.file(profileImage!, height: 100, width: 100)
                  : SizedBox.shrink(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickCV,
                child: Text('Upload CV (PDF only)'),
              ),
              cvFile != null
                  ? Text('Selected CV: ${cvFile!.path.split('/').last}')
                  : SizedBox.shrink(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
