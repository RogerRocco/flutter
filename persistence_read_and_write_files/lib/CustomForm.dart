import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistence_read_and_write_files/CustomDataStorage.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.storage});

  final CustomDataStorage storage;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String _json = "";
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((json) {
      setState(() {
        _json = json;
        _controller.text = _json.toString();
      });
    });
  }

  Future<File> _save(json) {
    setState(() => _json = json);
    return widget.storage.writeCounter(_json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reading and Writing Files'),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter here a great value to be saved',
                  ),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Saved')));
              _save(_controller.text);
            },
            child: const Text('Save'),
          ),
        ]));
  }
}
