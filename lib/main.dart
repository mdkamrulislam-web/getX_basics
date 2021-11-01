import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/screens/details_page.dart';
import 'package:getx_basics/screens/password_change.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void _showBottomSheet() {
      Get.bottomSheet(
        Container(
          width: double.infinity,
          height: Get.height / 5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const Text("Bottom Sheet"),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ElevatedButton(
                onPressed: _goToSecondPage,
                child: Text("Go to the Details Page!")),
            const ElevatedButton(
                onPressed: _showSnackBar, child: Text("Show Snack Bar!")),
            const ElevatedButton(
                onPressed: _showDialog, child: Text("Show Dialog!")),
            ElevatedButton(
                onPressed: _showBottomSheet,
                child: const Text("Show Bottom Sheet!")),
          ],
        ),
      ),
    );
  }
}

void _goToSecondPage() {
  // ignore: avoid_print
  print("Going to Second Page!");
  Get.to(() => const DetailsPage());
}

void _showSnackBar() {
  // ignore: avoid_print
  print("Showing Snack Bar!");

  Get.snackbar(
    'Md. Kamrul Islam',
    'Flutter Developer',
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    backgroundColor: Colors.black,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(12),
    snackStyle: SnackStyle.FLOATING,
  );
}

void _showDialog() {
  // ignore: avoid_print
  print("Showing Dialog!");

  Get.defaultDialog(
    title: "Warning",
    content: const Text('Wrong Password!'),
    barrierDismissible: false,
    textConfirm: "Change Password",
    onConfirm: () {
      // ignore: avoid_print
      print("Confirmed!");
      Get.to(() => const PasswordChangePage());
    },
    textCancel: "Cancel",
    onCancel: () {
      // ignore: avoid_print
      print("Cancelled!");
      Get.back();
    },
  );
}
