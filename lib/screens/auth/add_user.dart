import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lookme/components/textfieldform/add_user_textfield.dart';
import 'package:lookme/service/http_service.dart';

class AddUserForm extends StatefulWidget {
  final String phoneNumber;

  const AddUserForm({super.key, required this.phoneNumber});

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  HttpService service = HttpService();

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNumber;
    }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        var response = await service.addItem(
          endpointUrl: 'api/customer/tele/add-customer',
          itemData: {
            "name": _nameController.text,
            "email": _emailController.text,
            "phone": _phoneController.text,
            "password": _passwordController.text,
            "country": _countryController.text,
            "city": _cityController.text,
            "address": _shippingAddressController.text,
          },
        );

        if (response?.statusCode == 201) {
          await Future.delayed(Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User added successfully!')),
          );
          Navigator.pop(context, _phoneController.text);
        } else {
          log("error ---> ${response?.statusCode}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add user')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AddUserTextfield(
                  hintText: 'Name',
                  controller: _nameController,
                  validator: (value) => value!.isEmpty ? 'Enter a name' : null,
                  obsecureText: false,
                  readOnly: false,
                ),
                AddUserTextfield(
                  hintText: 'Email',
                  controller: _emailController,
                  obsecureText: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email' : null,
                  readOnly: false,
                ),
                AddUserTextfield(
                  hintText: 'Phone',
                  controller: _phoneController,
                  obsecureText: false,
                  readOnly: true,
                ),
                AddUserTextfield(
                  hintText: 'Password',
                  controller: _passwordController,
                  obsecureText: true,
                  readOnly: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your password' : null,
                ),
                AddUserTextfield(
                  hintText: 'Shipping Address',
                  controller: _shippingAddressController,
                  obsecureText: false,
                  readOnly: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Shipping address' : null,
                ),
                AddUserTextfield(
                  hintText: 'City',
                  controller: _cityController,
                  obsecureText: false,
                  readOnly: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your City' : null,
                ),
                AddUserTextfield(
                  hintText: 'Country',
                  controller: _countryController,
                  obsecureText: false,
                  readOnly: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an country' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
