import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _timeList = ['-1H', '-10분', '-1분', '+1분', '+10분', '+1H'];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 40.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          DateFormat('MM월 dd일').format(now),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('HH:mm').format(now),
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              DateFormat('a').format(now),
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(right: 8.0, top: 20.0, bottom: 20.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "+ 완료 시간",
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _timeList.map((value) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              primary: Colors.grey,
                          ),
                          onPressed: () {},
                          child: Text(
                            value,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
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
