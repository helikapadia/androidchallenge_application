import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class details extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}
final GlobalKey<FormBuilderState> _fbKey= GlobalKey<FormBuilderState>();
class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/t1.jpg'),
              ),
              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: "name",
                      decoration: InputDecoration(labelText: "Name"),
                      validators: [FormBuilderValidators.requiredTrue()],
                    ),
                    FormBuilderTextField(
                      attribute: "age",
                      decoration: InputDecoration(labelText: "Age"),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(70),
                      ],
                    ),
                    FormBuilderDropdown(
                      attribute: "gender",
                      decoration: InputDecoration(labelText: "Gender"),
                      // initialValue: 'Male',
                      hint: Text('Select Gender'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text("$gender")
                      )).toList(),
                    ),
                    MaterialButton(
                      child: Text('Submit'),
                        onPressed: ()=>details(),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
