import 'package:flutter/gestures.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class Otp extends StatelessWidget {

  const Otp({ super.key });

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(
              maxWidth: IKSizes.container
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
                                  IKImages.authbanner4,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Enter Code', 
                                style: Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text("An Authentication Code Has Sent To",
                                style : Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 15)),
                                textAlign: TextAlign.left,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 2),
                              Text("testing@gmail.com",
                                style : Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(color: IKColors.primary,fontSize: 15,decoration: TextDecoration.underline,decorationColor:IKColors.primary,decorationThickness: 2.0,)),
                                textAlign: TextAlign.left,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 25),
                              PinCodeTextField(
                                appContext:context,
                                length: 6,
                                obscureText: true,
                                obscuringCharacter: '*',
                                blinkWhenObscuring: true,
                                animationType: AnimationType.scale,
                                pinTheme: PinTheme(
                                  shape:  PinCodeFieldShape.box,
                                  fieldHeight: 48,
                                  fieldWidth: 48,
                                  activeColor: Theme.of(context).canvasColor,
                                  selectedColor: Theme.of(context).textTheme.titleMedium?.color,
                                  inactiveColor: Theme.of(context).canvasColor,
                                  inactiveFillColor: Theme.of(context).canvasColor,  // Set the background color when inactive
                                  selectedFillColor: Theme.of(context).canvasColor,    // Set the background color when selected
                                  activeFillColor: Theme.of(context).canvasColor,      // Set the background color when active
                                  
                                ),
                                textStyle: Theme.of(context).textTheme.headlineLarge,
                                cursorColor: Theme.of(context).textTheme.titleMedium?.color,
                                animationDuration: const Duration(milliseconds: 200),
                                keyboardType: TextInputType.number,
                                enableActiveFill: true,  // Make sure to enable active fill
                                onCompleted: (v) {
                                  debugPrint("Completed");
                                },
                                onChanged: (value) {
                                  debugPrint(value); 
                                },
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
                          Navigator.pushNamed(context, '/comfirmcode');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                          side: const BorderSide(color: IKColors.secondary),
                          foregroundColor: Theme.of(context).cardColor
                        ),  
                        child: const Text('Verify and proceed')
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
