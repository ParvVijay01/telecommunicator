import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lookme/components/social/social_button.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';

import '../../utils/constants/sizes.dart';

class SignUp extends StatelessWidget {
const SignUp({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(
              maxWidth: IKSizes.container,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(150)),
                          child: Image.asset(
                              IKImages.authbanner2,
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
                        Text('Create your account', 
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Text("Welcome back! Please enter your details",
                          style : Theme.of(context).textTheme.bodyLarge?.merge( TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 15)),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 15),
                        Text('Name',
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
                        Text('Email Address',
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
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signin');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                              side: const BorderSide(color: IKColors.secondary),
                              foregroundColor: Theme.of(context).cardColor
                            ), 
                            child: const Text('Sign Up')),
                        ),
                        const SizedBox(height: 40),
                        Row (
                          children: [
                            Expanded(child: Container( height:1, color:Theme.of(context).textTheme.titleMedium?.color,)),
                            const SizedBox(width: 10),
                            Text('Or continue with', style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color,fontSize: 13, fontWeight: FontWeight.w500)), ),
                            const SizedBox(width: 10),
                            Expanded(child: Container(height:1, color:Theme.of(context).textTheme.titleMedium?.color,))
                          ]

                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,bottom: 0),
                          child: SocialButton(
                            onTap :(){
                            },
                            type : 'google',
                            title : 'Sign in with google'
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,bottom: 0),
                          child: SocialButton(
                            onTap :(){
                            },
                            type : 'facebook',
                            title : 'Sign in with facebook'
                          ),
                        ),
                        const SizedBox(height: 30),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Already have and account? ",
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
                  ],
              ),
            )
          ),
        )
      ),
    );
  }
}