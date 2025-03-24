import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messageList = [
    {
      'type': 'receive',
      'image': IKImages.chatUser2,
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message': 'Good morning!',
        },
        {
          'message': "I'm looking for a new laptop",
        },
      ],
    },
    {
      'type': 'send',
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message': 'Good morning!',
        },
        {
          'message': "Of course, we have a great selection of laptops.",
        },
      ],
    },
    {
      'type': 'receive',
      'image': IKImages.chatUser2,
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message':
              "I'll mainly use it for work, so something with good processing power and a comfortable keyboard is essential.",
        },
      ],
    },
    {
      'type': 'send',
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message': 'Got it!',
        },
        {
          'message':
              "We have several options that would suit your needs. Let me show you a few models that match your criteria.",
        },
      ],
    },
    {
      'type': 'receive',
      'image': IKImages.chatUser2,
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message': "I'm looking to spend around \$800 to \$1,000.",
        },
      ],
    },
    {
      'type': 'send',
      'time': '10:30',
      'data': <Map<String, String>>[
        {
          'message':
              "That's a good budget. I'll show you a few options within that range. Are you interested in Windows or Mac laptops?",
        },
      ],
    },
  ];

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  String message = '';

  void sendMessage() {
    setState(() {
      if (message.isNotEmpty) {
        messageList.add({
          'type': 'send',
          'time': '10:30',
          'data': <Map<String, String>>[
            {
              'message': message,
            },
          ],
        });
      }
      controller.text = '';
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: IKColors.card,
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxWidth: IKSizes.container),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 15, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).canvasColor))),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:
                          Image.asset(IKImages.profile, height: 40, width: 40),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Emily Johnson',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: IKColors.success,
                              ),
                              height: 10,
                              width: 10,
                            ),
                            Text('Online',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(const TextStyle(
                                        fontWeight: FontWeight.w300))),
                          ],
                        )
                      ],
                    )),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chat_call');
                      },
                      icon: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF59BD56),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.string(
                          IKSvg.call,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: messageList.map((data) {
                    return Column(
                      crossAxisAlignment: data['type'] == 'send'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          width: MediaQuery.of(context).size.width * .9,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (data['type'] == 'receive')
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(data['image']!,
                                          height: 40, width: 40)),
                                ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: data['type'] == 'send'
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: data['type'] == 'send'
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: (data['data']
                                            as List<Map<String, String>>)
                                        .map((item) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: data['type'] == 'send'
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.color
                                              : Theme.of(context).canvasColor,
                                        ),
                                        child: Text(item['message']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.merge(TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        data['type'] == 'send'
                                                            ? Theme.of(context)
                                                                .cardColor
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.color,
                                                    height: 1.4))),
                                      );
                                    }).toList(),
                                  ),
                                  Text(data['time']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.merge(const TextStyle(
                                              fontWeight: FontWeight.w500)))
                                ],
                              ))
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )),
              Container(
                height: 75,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 20,
                      ),
                    ],
                    border: Border(
                        top: BorderSide(
                            width: 1, color: Theme.of(context).canvasColor))),
                alignment: Alignment.center,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      message = value;
                    });
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).canvasColor,
                      prefixIcon: IconButton(
                          icon: const Icon(Icons.emoji_emotions_outlined,
                              color: IKColors.primary),
                          onPressed: () {}),
                      hintText: 'Type Something',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: SvgPicture.string(
                          IKSvg.send,
                          width: 20,
                          height: 20,
                          color: IKColors.title,
                        ),
                      ),
                      border: InputBorder.none),
                  style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color)),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
