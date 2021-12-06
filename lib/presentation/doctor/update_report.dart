import 'package:flutter/material.dart';

class AddReport extends StatelessWidget {
  const AddReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _input = TextEditingController(text: '26');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nguyễn Văn A'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // ignore: avoid_unnecessary_containers
            Row(
              children: [
                const CustomeBox(title: 'Nhiệt độ'),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    controller: _input,
                    decoration: const InputDecoration(
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const CustomeBox(title: 'Khó thở'),
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.remove))),
                const SizedBox(width: 10),
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.done))),
              ],
            ),
            Row(
              children: [
                const CustomeBox(title: 'Sốt cao'),
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.remove))),
                const SizedBox(width: 10),
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.done))),
              ],
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeBox extends StatelessWidget {
  const CustomeBox({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
