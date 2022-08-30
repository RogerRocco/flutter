import 'package:flutter/material.dart';
import 'package:app_state_management/models/DataClass.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _myController = TextEditingController();
  final _myController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    debugPrint("Disposing state");
    _myController.dispose();
    _myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Form'),
            ),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _myController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter some text'
                        : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Subtitle',
                  ),
                  controller: _myController2,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter some text'
                        : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Sent')));
                      Navigator.pop(context,
                          DataClass(_myController.text, _myController2.text));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ])));
  }
}
