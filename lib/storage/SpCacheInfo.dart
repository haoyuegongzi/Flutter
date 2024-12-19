import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_util/sp_util.dart';

void main() {
  SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController teCcontroller = TextEditingController();
  String savedText = '';

  @override
  void initState() {
    super.initState();
    loadSavedText();
  }

  // Function to load saved text from SharedPreferences
  void loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedText = prefs.getString('saved_text') ?? '拿到的缓存数据是空的';
    });
  }

  // Function to save text to SharedPreferences
  void saveText() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('saved_text', teCcontroller.text);
    setState(() {
      savedText = teCcontroller.text;
    });

    // save
    await sharedPreferences.setString(
        "createStorageSp", "save SharedPreferences info");
    // get
    var obtainValue = sharedPreferences.get("createStorageSp");
    print("createStorageSp, obtainValue: $obtainValue");
    // remove
    sharedPreferences.remove("createStorageSp");
    obtainValue = sharedPreferences.get("createStorageSp");
    print("createStorageSp, after remove, obtainValue: $obtainValue");
    // clear
    await sharedPreferences.setString(
        "createStorageSp", "save SharedPreferences info");
    obtainValue = sharedPreferences.get("createStorageSp");
    print("createStorageSp, obtainValue: $obtainValue");
    sharedPreferences.clear();
    obtainValue = sharedPreferences.get("createStorageSp");
    print("createStorageSp, after clear, obtainValue: $obtainValue");

    Map<String, Object> mapData = {"age": 10000, "address": "天府大道中轴线"};
    SharedPreferences.setMockInitialValues(mapData);
    // 上面用 Map 的形式保存的数据，在获取的时候，要用 get(key)的方式去获取，不能通过 getxxx(key)的方式获取；否则获取到的是null；
    var age = sharedPreferences.get("age");
    var address = sharedPreferences.get("address");
    print("createStorageSp, save a map, age: $age,   address: $address");

    saveDataBySpUtil();
  }

  // 这种方式保存的数据，获取到的是 null 空的。
  void saveDataBySpUtil() async {
    Map<String, Object> mapData = {"gongzi": 10000, "address": "天府大道中轴线"};
    SpUtil.putObject("keyMap", mapData);
    Map? getMapData = SpUtil.getObject("keyMap");
    getMapData?.forEach((key, value) {
      print("saveDataBySpUtil, save a map, key: $key,   value: $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: teCcontroller,
              decoration: const InputDecoration(labelText: 'Enter some text'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: saveText,
              child: const Text('Save Text'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Saved Text:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(savedText),
          ],
        ),
      ),
    );
  }
}
