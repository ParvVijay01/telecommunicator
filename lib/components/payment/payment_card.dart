import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/colors.dart';

class PaymentCard extends StatelessWidget {
  final String type;
  final String cardNumber;
  final String name;
  final String exp;
  final String cvv;
  final String cardImg;
  final String? activeCard;
  final String? id;
  final bool? addCard;

  const PaymentCard({
    super.key,
    required this.type,
    required this.cardNumber,
    required this.name,
    required this.exp,
    required this.cvv,
    required this.cardImg,
    this.activeCard,
    this.id,
    this.addCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          addCard == true ? const EdgeInsets.all(25) : const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: type == 'Debit Card' ? Color(0xFF515151) : IKColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (addCard != true)
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: activeCard == id ? Colors.white : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: activeCard == id ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              if (addCard != true)
                const SizedBox(
                  width: 10,
                ),
              Expanded(
                child: Text(type.toUpperCase(),
                    style: Theme.of(context).textTheme.titleSmall?.merge(
                        const TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
              ),
              Image.asset(cardImg, height: 17),
            ],
          ),
          const SizedBox(height: 18),
          Text(cardNumber,
              style: Theme.of(context).textTheme.headlineMedium?.merge(
                  TextStyle(
                      fontSize: addCard == true ? 20 : 18,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500))),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(name.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.merge(
                        const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500))),
              ),
              Column(
                children: [
                  Text('EXP',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(color: Colors.white54))),
                  Text(exp,
                      style: Theme.of(context).textTheme.titleMedium?.merge(
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500))),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text('CVV',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(color: Colors.white54))),
                  Text(cvv,
                      style: Theme.of(context).textTheme.titleMedium?.merge(
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500))),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
