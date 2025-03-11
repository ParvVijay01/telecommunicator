import 'package:lookme/components/input/border_input.dart';
import 'package:lookme/components/input/input.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  const Inputs({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container
            ),
            child: AppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon:Icon(Icons.arrow_back_ios,size: 20),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              title: const Text('Inputs'),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                    color: IKColors.light,
                    height: 1.0,
                )
              ),
            ),
          ),
        )
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Classic Input',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Input(
                              hintText: 'Enter Username',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            Input(
                              hintText: 'Enter Email',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            Input(
                              type: 'password',
                              hintText: 'Enter Password',
                              onChangeEvent: (e) {

                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Input with Icon',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Input(
                              prefixIcon : const Icon(Icons.person,size: 20,color:IKColors.primary),
                              hintText: 'Enter Username',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            Input(
                              prefixIcon : const Icon(Icons.email,size: 20,color:IKColors.primary),
                              hintText: 'Enter Email',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            Input(
                              prefixIcon : const Icon(Icons.lock,size: 20,color:IKColors.primary),
                              type: 'password',
                              hintText: 'Enter Password',
                              onChangeEvent: (e) {

                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Border Input',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            BorderInput(
                              hintText: 'Enter Username',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            BorderInput(
                              prefixIcon : const Icon(Icons.person,size: 20,color:IKColors.primary),
                              hintText: 'Enter Username',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            BorderInput(
                              prefixIcon: SizedBox(
                                height: 50,
                                width: 125,
                                child: CountryCodePicker(
                                  dialogSize:Size(IKSizes.container - 40, MediaQuery.of(context).size.height - 200),
                                  boxDecoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  onChanged: print,
                                  showFlagMain: true,
                                  initialSelection: 'IN',
                                  alignLeft: true,
                                  padding: const EdgeInsets.all(0),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              hintText: 'Enter Phone',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            BorderInput(
                              type: 'password',
                              prefixIcon : const Icon(Icons.lock,size: 20,color:IKColors.primary),
                              hintText: 'Enter Password',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Input with different sizes',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Input(
                                hintText: 'Enter Username',
                                size : 'sm',
                                onChangeEvent: (e) {
                              
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Input(
                              hintText: 'Enter Email',
                              onChangeEvent: (e) {

                              },
                            ),
                            const SizedBox(height: 10),
                            Input(
                              size : 'lg',
                              type: 'password',
                              hintText: 'Enter Password',
                              onChangeEvent: (e) {

                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}