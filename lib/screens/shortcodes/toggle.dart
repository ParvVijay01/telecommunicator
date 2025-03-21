import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

enum ShirtSize { extraSmall, small, medium, large, extraLarge }

const List<(ShirtSize, String)> shirtSizeOptions = <(ShirtSize, String)>[
  (ShirtSize.extraSmall, 'XS'),
  (ShirtSize.small, 'S'),
  (ShirtSize.medium, 'M'),
  (ShirtSize.large, 'L'),
  (ShirtSize.extraLarge, 'XL'),
];

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange')
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  final List<bool> _toggleButtonsSelection =
      ShirtSize.values.map((ShirtSize e) => e == ShirtSize.medium).toList();

  final List<bool> _selectedFruits = <bool>[true, false, false];
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  final List<bool> _selectedWeather = <bool>[false, false, true];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(IKSizes.container, IKSizes.headerHeight),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: IKSizes.container),
              child: AppBar(
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
                title: const Text('Toggle'),
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: IKColors.light,
                      height: 1.0,
                    )),
              ),
            ),
          )),
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
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(IKSizes.borderRadiusSm)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('ToggleButtons',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        // This ToggleButtons allows multiple or no selection.
                        ToggleButtons(
                          // ToggleButtons uses a List<bool> to track its selection state.
                          isSelected: _toggleButtonsSelection,
                          // This callback return the index of the child that was pressed.
                          onPressed: (int index) {
                            setState(() {
                              _toggleButtonsSelection[index] =
                                  !_toggleButtonsSelection[index];
                            });
                          },
                          borderRadius:
                              BorderRadius.circular(IKSizes.borderRadiusSm),
                          // Constraints are used to determine the size of each child widget.
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 56.0,
                          ),
                          borderColor: Theme.of(context).dividerColor,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fillColor: IKColors.primary,
                          selectedColor: Colors.white,
                          selectedBorderColor: IKColors.primary,
                          // ToggleButtons uses a List<Widget> to build its children.
                          children: shirtSizeOptions
                              .map(((ShirtSize, String) shirt) => Text(shirt.$2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)))
                              .toList(),
                        ),
                        const SizedBox(height: 15),
                        Text('Single select',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 5),
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              // The button that is tapped is set to true, and the others to false.
                              for (int i = 0; i < _selectedFruits.length; i++) {
                                _selectedFruits[i] = i == index;
                              }
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.red[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.red[200],
                          color: Colors.red[400],
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedFruits,
                          children: fruits,
                        ),
                        const SizedBox(height: 15),
                        // ToggleButtons with a multiple selection.
                        Text('Multi select',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 5),
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            // All buttons are selectable.
                            setState(() {
                              _selectedVegetables[index] =
                                  !_selectedVegetables[index];
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.green[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.green[200],
                          color: Colors.green[400],
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedVegetables,
                          children: vegetables,
                        ),
                        const SizedBox(height: 15),
                        // ToggleButtons with icons only.
                        Text('Icon only',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 5),
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              // The button that is tapped is set to true, and the others to false.
                              for (int i = 0;
                                  i < _selectedWeather.length;
                                  i++) {
                                _selectedWeather[i] = i == index;
                              }
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.blue[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.blue[200],
                          color: Colors.blue[400],
                          isSelected: _selectedWeather,
                          children: icons,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
