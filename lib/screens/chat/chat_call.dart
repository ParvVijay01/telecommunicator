import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:flutter/material.dart';

class ChatCall extends StatelessWidget {
  const ChatCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        // backgroundColor: IKColors.primary,
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 32,
                      icon: const Icon(Icons.arrow_back, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
                child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      IKImages.chatUser1,
                      height: 120,
                      width: 120,
                    )),
                const SizedBox(height: 15),
                const Text('15:35',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.volume_up,
                          size: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: IKColors.danger,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.call_end,
                          size: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:
                          const Icon(Icons.mic, size: 24, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
