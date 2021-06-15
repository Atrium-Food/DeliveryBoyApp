import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  final int amount;
  final String email;
  final String phone;
  final String name;

  const Payment(
      {@required this.amount,
      @required this.email,
      @required this.phone,
      @required this.name});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handelPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handelPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handelExternalWallet);

    openCheckout();

    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();

    _razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_aURf4ODKVDWdgJ',
      'amount': widget.amount * 100,
      'name': widget.name,
      'description': 'Deposit',
      'prefill': {'contact': widget.phone, 'email': widget.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handelPaymentSuccess() {
    print('payment Successful');
  }

  void handelPaymentError() {
    print('Error');
  }

  void handelExternalWallet() {
    print('external Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
