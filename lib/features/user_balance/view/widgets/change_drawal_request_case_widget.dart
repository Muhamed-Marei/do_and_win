import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/requesr_drawal_provider.dart';

class ButtonTabToChangeRequestCase extends StatelessWidget {
  const ButtonTabToChangeRequestCase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ref.watch(requestCaseProvider.state).state
                            ? const Color.fromRGBO(11, 32, 73, 1)
                            : Colors.blue,
                      ),
                      onPressed: () {
                        ref.watch(requestCaseProvider.state).state = false;
                      },
                      child: const Text(
                        "الطلبات السحب السابقه ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ref.watch(requestCaseProvider.state).state
                            ? Colors.blue
                            : const Color.fromRGBO(11, 32, 73, 1),
                      ),
                      onPressed: () {
                        ref.watch(requestCaseProvider.state).state = true;
                      },
                      child: const Text("الطلبات السحب الحاليه ",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
            ],
          );
        },
      ),
    );
  }
}
