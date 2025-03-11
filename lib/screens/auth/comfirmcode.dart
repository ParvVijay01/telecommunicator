import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/sizes.dart';

class Comfirmcode extends StatelessWidget {
const Comfirmcode({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(
              maxWidth:IKSizes.container
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(150)),
                              child: Image.asset(
                                  IKImages.authbanner5,
                                  width: double.infinity, 
                                  height: 170, 
                                  fit:BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: GestureDetector(
                                onTap: () => {  Navigator.of(context).pop() },
                                child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black12,
                                ),
                                height: 35,
                                width: 35,
                                child: Icon(Icons.chevron_left_rounded,size: 30,color: Colors.white))
                              )
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30,top: 25,bottom: 10),
                          constraints: const BoxConstraints(
                            maxWidth: IKSizes.container
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Enter New Password', 
                                style: Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                                Text("Your new password must be different from previously used password.",
                                style : Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 15)),
                                textAlign: TextAlign.left,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 20),
                              Text('Password',
                                style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 15, fontWeight: FontWeight.w500)),                    
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15),
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  fillColor:Theme.of(context).canvasColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).canvasColor,width: 2.0),
                                    borderRadius: BorderRadius.circular(0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:Theme.of(context).brightness == Brightness.dark ? IKColors.card: IKColors.secondary,width: 2.0),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                              ),
                              const SizedBox(height: 15),
                              Text('Confirm Password',
                                style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 15, fontWeight: FontWeight.w500)),                    
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15),
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  fillColor:Theme.of(context).canvasColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).canvasColor,width: 2.0),
                                    borderRadius: BorderRadius.circular(0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:Theme.of(context).brightness == Brightness.dark ? IKColors.card: IKColors.secondary,width: 2.0),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        } ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                          side: const BorderSide(color: IKColors.secondary),
                          foregroundColor: Theme.of(context).cardColor
                        ),  
                        child: const Text('Continue')
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Back To",
                          style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign In',
                              style: const TextStyle(color: IKColors.primary,fontWeight: FontWeight.w600,decoration: TextDecoration.underline,decorationColor:IKColors.primary,decorationThickness: 2.0,),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Navigator.pushNamed(context, '/signin');
                              }
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]
            )
          ),
        )
      ),
    );
  }
}