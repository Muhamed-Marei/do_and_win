import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: const Text("Your account has been blocked"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Image.asset("assets/blockIcon.gif"),
              ),
            ),
            ListTile(
              title: const Text("result", style: TextStyle(fontSize: 30)),
              subtitle: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Text(
                    "bad using your account ",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Conect with admin"))
          ],
        ),
      ),
    );
  }
}
