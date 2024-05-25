import 'package:flutter/material.dart';
import 'package:healthcare/screens/preview_page.dart';

import 'package:healthcare/screens/appointment_screen1.dart';
import 'package:healthcare/screens/appointment_screen2.dart';
import 'package:healthcare/screens/appointment_screen3.dart';
import 'package:healthcare/screens/appointment_screen4.dart';


class DetailsPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  final sexController = TextEditingController();
  final ailmentController = TextEditingController();
  final appointmentDateController = TextEditingController();
  final timeController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
        backgroundColor: const Color.fromARGB(255, 232, 233, 234),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF7165D6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Patient Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                SizedBox(height: 20),
                _buildTextField(firstNameController, 'First Name'),
                _buildTextField(lastNameController, 'Last Name'),
                _buildTextField(phoneNumberController, 'Phone Number'),
                _buildTextField(ageController, 'Age'),
                _buildTextField(sexController, 'Sex'),
                _buildTextField(ailmentController, 'Ailment'),
                _buildTextField(appointmentDateController, 'Appointment Date'),
                _buildTextField(timeController, 'Time'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviewPage(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                            age: ageController.text,
                            sex: sexController.text,
                            ailment: ailmentController.text,
                            appointmentDate: appointmentDateController.text,
                            time: timeController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('View preview'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF7165D6), // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF7165D6)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelStyle: TextStyle(color: Color(0xFF7165D6)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF7165D6)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $labelText';
          }
          return null;
        },
      ),
    );
  }
}