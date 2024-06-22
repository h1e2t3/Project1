import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project1/Controller/Validation.dart';

import '../../Model/Api_method/Show_user_details.dart';
import '../../Model/Common_widget/Common_Textfield.dart';
import '../../Model/Lists/App_lists.dart';
import 'chat_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode textfiled = FocusNode();
  Color Containercolor = Colors.red;
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  DateTime? _selectedDate;
  bool eye = false;
  List<TextEditingController> controller = [];

  void initState() {
    super.initState();
    textfiled = FocusNode();
    // Initialize the list with a specific number of controllers
    textfiled.addListener(() {
      setState(() {
        Containercolor = textfiled.hasFocus ? Colors.green : Colors.red;
      });
    });
  }

  void dispose() {
    // Dispose all the controllers to free up resources
    textfiled.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String _selectedGender = 'Prefer not to say';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.cherrySwash(
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff438E96),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Please enter your credentials to proceed',
                  style: GoogleFonts.exo(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff3A4750),
                  )),
              SizedBox(height: 30),
              CommonTextField(
                data: 'Full Name',
                controller: _fullNameController,
                hintText: 'Het Kansara',
                focusNode: textfiled,
                color: Containercolor,
                obscureText: false,
              ),
              SizedBox(height: 24),
              Text(
                "Phone Number",
                style: GoogleFonts.exo(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3B757F),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                child: IntlPhoneField(
                  controller: _phoneController,
                  focusNode: textfiled,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              CommonTextField(
                data: 'Email',
                controller: _emailController,
                hintText: 'hetk266@gmail.com',
                focusNode: textfiled,
                color: Containercolor,
                obscureText: false,
              ),
              SizedBox(height: 24),
              CommonTextField(
                data: 'Password',
                controller: _passwordController,
                hintText: '1234567890',
                focusNode: textfiled,
                color: Containercolor,
                obscureText: eye,
                suffixIcon: IconButton(
                  icon:
                      Icon(eye ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                  onPressed: () {
                    setState(() {
                      eye = !eye;
                    });
                  },
                ),
                keyboardType: TextInputType.number,
                maxLength: 8,
              ),
              CommonTextField(
                data: 'Address',
                controller: _addressController,
                hintText: 'Address',
                focusNode: textfiled,
                color: Containercolor,
                obscureText: false,
              ),
              SizedBox(height: 24),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Country',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: coutryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'State',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: [''].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'City',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: [''].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: 20),
              CommonTextField(
                data: 'Postal Code',
                controller: _emailController,
                hintText: '123456',
                focusNode: textfiled,
                color: Containercolor,
                obscureText: false,
                maxLength: 6,
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate)
                    setState(() {
                      _selectedDate = picked;
                    });
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'My date of birth',
                  ),
                  child: Text(
                    _selectedDate == null
                        ? 'Select date'
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  try {

                    final data=await loginUser(email, password);
                    // Navigate to another page or show success message
                    Get.to(ChatPage(name:_emailController.text.data,),);
                  } catch (e) {
                    // Show error message
                    print(e);
                  }
                  // if (_formKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('Processing Data')),
                  //   );
                  // }
                },
                child: Text('CREATE ACCOUNT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
