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
  var _setTarget = false;
  ChromeMode _chromeMode = ChromeMode.attach;
  final _timeList = ['-1H', '-10분', '-1분', '+1분', '+10분', '+1H'];
  final _adjList = ['-20', '-10', '-5', '+5', '+10', '+20'];
  final _minList = ['-5분', '-1분', '+1분', '+5분'];
  final _btnList = ['유산균', '비타민D', '+'];

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
      body: SingleChildScrollView(
        child: Column(
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
                        padding: EdgeInsets.only(
                            right: 8.0, top: 20.0, bottom: 20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "+ 완료 시간",
                            style: TextStyle(
                              color: Colors.indigoAccent,
                              fontSize: 16.0,
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
            Card(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          top: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '분유량',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 180.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0, top: 4.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              const Text(
                                '목표량',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              ),
                              Switch(
                                value: _setTarget,
                                onChanged: (value) {
                                  setState(() {
                                    _setTarget = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: const [
                            Text(
                              '180',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.indigo,
                              ),
                            ),
                            Text(
                              'ml',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 4.0,
                        ),
                        child: SizedBox(
                          width: 30.0,
                          child: IconButton(
                            icon: const Icon(Icons.alarm),
                            color: Colors.indigo,
                            iconSize: 25.0,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _adjList.map((value) {
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
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const Text(
                          '분유 시간',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.expand_less),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 120,
                      ),
                      Row(
                        children: const [
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo,
                            ),
                          ),
                          Text(
                            '분',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            primary: Colors.grey,
                          ),
                          onPressed: () {},
                          child: const Text(
                            '지금 다 먹었어요!',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _minList.map((value) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
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
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '메모',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          width: 300.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "메모 입력",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt),
                          iconSize: 40.0,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _btnList.map((value) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            side: const BorderSide(
                                width: 1.0, style: BorderStyle.none),
                            backgroundColor: Colors.blue.shade50,
                          ),
                          onPressed: () {},
                          child: Text(
                            value,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 15.0,
                              color: Colors.indigo,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                              '취소',
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            backgroundColor: Colors.indigo,
                          ),
                          onPressed: () {},
                          child: const Text(
                              '저장',
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
