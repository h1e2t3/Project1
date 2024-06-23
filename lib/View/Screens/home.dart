import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project1/Controller/Validation.dart';
import 'package:project1/Model/Common_widget/Common_Textfield.dart';
import 'package:project1/Model/Lists/App_lists.dart';
import '../../Model/Common_widget/Common_dropdowns.dart';
import 'chat_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _postalCodeFocusNode = FocusNode();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  DateTime? _selectedDate;
  bool eye = false;
  String _selectedGender = 'Male';
  String? _countryError;
  String? _stateError;
  String? _cityError;
  String? _phoneerror;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
          setState(() {
            _selectedDate = picked;
          });
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _selectedGender = value!;
    });
  }
  void _validateAndSubmit() {
    setState(() {
      _countryError = null;
      _stateError = null;
      _cityError = null;
      _phoneerror=null;
    });

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
      Get.to(
        ChatPage(
          user: _fullNameController.text,
        ),
      );
    } else {
      // Set errors for Dropdowns if not selected
      setState(() {
        _countryError = _countryError ?? 'Please select a country';
        _stateError = _stateError ?? 'Please select a state';
        _cityError = _cityError ?? 'Please select a city';
      });
    }
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _addressFocusNode.dispose();
    _postalCodeFocusNode.dispose();

    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

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
                focusNode: _fullNameFocusNode,
                obscureText: false,
                validator: Validator.validateFullname,
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
                  focusNode: _phoneFocusNode,
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
                focusNode: _emailFocusNode,
                obscureText: false,
                validator: Validator.validateEmail,
              ),
              SizedBox(height: 24),
              CommonTextField(
                data: 'Password',
                controller: _passwordController,
                hintText: '1234567890',
                focusNode: _passwordFocusNode,
                obscureText: eye,
                validator: Validator.validatePassword,
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
              Text('Address:',
                  style: GoogleFonts.exo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF438E96),
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 4),
              CommonTextField(
                controller: _addressController,
                hintText: 'Address',
                focusNode: _addressFocusNode,
                obscureText: false,
                data: '',
                validator: Validator.ValidateAddress,
              ),
              SizedBox(height: 24),
              Text(
                  'Country',
                  style: GoogleFonts.exo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF438E96),
                          fontWeight: FontWeight.w600))
              ),
              SizedBox(height:6),
              ComnDropdwn(
                items:coutryList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                validator: (value) => value == null ? 'Please select a country' : null,
              ),
              SizedBox(height: 5,),
              if (_countryError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    _countryError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              SizedBox(height: 20),
              Text(
                  'State',
                  style: GoogleFonts.exo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF438E96),
                          fontWeight: FontWeight.w600))
              ),
              SizedBox(height:6),
              ComnDropdwn(
                items:StateList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                validator: (value) => value == null ? 'Please select a state' : null,
              ),
              SizedBox(height: 5),
              if (_stateError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    _stateError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              SizedBox(height: 20),
              Text(
                  'City',
                  style: GoogleFonts.exo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF438E96),
                          fontWeight: FontWeight.w600))
              ),
              SizedBox(height:6),
              ComnDropdwn(
                items:CityList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                validator: (value) => value == null ? 'Please select a city' : null,
              ),
              SizedBox(height: 5,),
              if (_cityError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    _cityError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              SizedBox(height: 20),
              CommonTextField(
                data: 'Postal Code',
                controller: _postalCodeController,
                hintText: '123456',
                focusNode: _postalCodeFocusNode,
                obscureText: false,
                maxLength: 6,
                validator: Validator.validatePostalCode,
              ),
              SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My date of birth:',
                  style: GoogleFonts.exo(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF438E96),
                          fontWeight: FontWeight.w600))
                ),
                SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:Color(0xFF438E96),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                              : 'Select',
                          style:  GoogleFonts.exo(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3B757F),
                  ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                ),
              ],
            ),
              SizedBox(height: 20),
              Text("Gender",style: GoogleFonts.exo(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF438E96),
                      fontWeight: FontWeight.w600)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Radio<String>(
                       activeColor:Color(0xFF438E96),
                        value: 'Mal',
                        groupValue: _selectedGender,
                        onChanged: _handleGenderChange,
                      ),
                      Text('Male',style: GoogleFonts.exo(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3B757F),
                      ),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: 'Female',
                        activeColor: Color(0xFF438E96),
                        groupValue: _selectedGender,
                        onChanged: _handleGenderChange,
                      ),
                      Text('Female',style:GoogleFonts.exo(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3B757F),
                      ),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: 'Others',
                        activeColor: Color(0xFF438E96),
                        groupValue: _selectedGender,
                        onChanged: _handleGenderChange,
                      ),
                      Text('Others',style: GoogleFonts.exo(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3B757F),
                      ),),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print(_fullNameController.text);
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                    Get.to(
                      ChatPage(
                        user: _fullNameController.text,
                      ),
                    );
                  }
                  else{
                    Validator.validateEmail;
                    Validator.validatePassword;
                    Validator.validatePostalCode;
                    Validator.validateFullname;
                  }
                },
                child: Text('CREATE ACCOUNT',style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3B757F),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}