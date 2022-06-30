import 'package:flutter/material.dart';

enum ChromeMode { attach, launch }

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var _isChecked = false;
  var _isChecked2 = false;
  ChromeMode _chromeMode = ChromeMode.attach;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "분유",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: null,
            child: Text(
              "저장",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Please enter your name:"),
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                const Text("Say hello when things get wrong."),
              ]),
          Switch(
            value: _isChecked2,
            onChanged: (value) {
              setState(() {
                _isChecked2 = value;
              });
            },
          ),
          RadioListTile(
            title: const Text("기존 크롬 사용"),
            value: ChromeMode.attach,
            groupValue: _chromeMode,
            onChanged: (value) {
              setState(() {
                _chromeMode = value as ChromeMode;
              });
            },
          ),
          RadioListTile(
            title: const Text("새로 크롬 런치"),
            value: ChromeMode.launch,
            groupValue: _chromeMode,
            onChanged: (value) {
              setState(() {
                _chromeMode = value as ChromeMode;
              });
            },
          ),
          ElevatedButton(
            child: const Text("Go back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
