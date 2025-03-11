import 'package:lookme/components/list/list_item.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Snackbars extends StatelessWidget {
  const Snackbars({ super.key });

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
              title: const Text('Snackbars'),
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
                ListItem(
                  icon: const Icon(Icons.check,size: 20,color: IKColors.primary,),
                  title: 'Success Snackbar',
                  onTap: () {
                    const snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: IKColors.success,
                      content: Row(
                        children: [
                          Icon(Icons.check_circle_outline,size: 16,color: Colors.white),
                          SizedBox(width: 4),
                          Text('Your Account Created Successfully!',style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
                ListItem(
                  icon: const Icon(Icons.warning_amber_outlined, size: 20,color: IKColors.primary,),
                  title: 'Warning Snackbar',
                  onTap: () {
                    const snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: IKColors.warning,
                      content: Row(
                        children: [
                          Icon(Icons.warning_amber_outlined,size: 16,color: Colors.white),
                          SizedBox(width: 4),
                          Text('Something Went wrong!',style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
                ListItem(
                  icon: const Icon(Icons.info_outline_rounded,color: IKColors.primary,),
                  title: 'Info Snackbar',
                  onTap: () {
                    const snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: IKColors.primary,
                      content: Row(
                        children: [
                          Icon(Icons.info_outline_rounded,size: 16,color: Colors.white),
                          SizedBox(width: 4),
                          Text('Please fill all the filelds.',style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
                ListItem(
                  icon: const Icon(Icons.close,color: IKColors.primary,),
                  title: 'Error Snackbar',
                  onTap: () {
                    const snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: IKColors.danger,
                      content: Row(
                        children: [
                          Icon(Icons.error,size: 16,color: Colors.white),
                          SizedBox(width: 4),
                          Text('Error Occured',style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}