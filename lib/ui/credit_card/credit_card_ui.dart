import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardUi extends StatefulWidget {
  const CreditCardUi({super.key});

  @override
  State<CreditCardUi> createState() => _CreditCardUiState();
}

class _CreditCardUiState extends State<CreditCardUi> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creadit Card Page'),
      ),
      body: Stack(
        children: [
          CreditCardWidget(
            cardNumber: "25445444444445151",
            expiryDate: "12/25",
            cardHolderName: "Goutom Roy",
            cvvCode: "155",
            showBackView: false,

            onCreditCardWidgetChange: (CreditCardBrand brand) {},
            bankName: 'Eastern Bank Ltd.',
            cardBgColor: Colors.black87,

            enableFloatingCard: false,
            floatingConfig: const FloatingConfig(
              isGlareEnabled: true,
              isShadowEnabled: true,
              shadowConfig: FloatingShadowConfig(),
            ),
            // backgroundImage: 'assets/card_bg.png',
            backgroundNetworkImage:
                "https://static.vecteezy.com/system/resources/thumbnails/009/097/172/small_2x/e-wallet-digital-wallet-application-internet-banking-online-payment-security-via-credit-card-online-money-transaction-concept-coin-icon-on-dark-background-eps10-illustration-free-vector.jpg",
            labelValidThru: 'VALID\nTHRU',
            obscureCardNumber: visibility,
            obscureInitialCardNumber: visibility,
            customCardTypeIcons: [
              CustomCardTypeIcon(
                  cardType: CardType.visa,
                  cardImage: Icon(
                    Icons.rocket,
                    color: Colors.white,
                  ))
            ],
            obscureCardCvv: visibility,
            labelCardHolder: 'CARD HOLDER',
            // labelValidThru: 'VALID\nTHRU',
            cardType: CardType.visa,
            isHolderNameVisible: true,
            height: 250,
            width: MediaQuery.of(context).size.width,
            isChipVisible: true,
            isSwipeGestureEnabled: true,
            animationDuration: Duration(milliseconds: 1000),
            frontCardBorder: Border.all(color: Colors.grey),
            backCardBorder: Border.all(color: Colors.grey),
            // chipColor: Colors.grey,
            padding: 0,
            // customCardTypeIcons: <CustomCardTypeIcons>[
            //   CustomCardTypeIcons(
            //     cardType: CardType.mastercard,
            //     cardImage: Image.asset(
            //       'assets/mastercard.png',
            //       height: 48,
            //       width: 48,
            //     ),
            //   ),
            // ],
          ),
          Positioned(
              left: 0,
              top: 0,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  child: Icon(
                    visibility ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
