import 'package:Anonymous_Hideout/Pay/payModel.dart';
import 'package:Anonymous_Hideout/Pay/in_app_payments.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'CartBloc.dart';
import 'OrderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'braintree_payment.dart';

class CartManager extends StatefulWidget {
  @override
  _CartManager createState() => new _CartManager();
}

class _CartManager extends State<CartManager> {
  CartBloc _cartBloc = new CartBloc();
  String clientNonce =
      "eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiJlNTc1Mjc3MzZiODkyZGZhYWFjOTIxZTlmYmYzNDNkMzc2ODU5NTIxYTFlZmY2MDhhODBlN2Q5OTE5NWI3YTJjfGNyZWF0ZWRfYXQ9MjAxOS0wNS0yMFQwNzoxNDoxNi4zMTg0ODg2MDArMDAwMFx1MDAyNm1lcmNoYW50X2lkPTM0OHBrOWNnZjNiZ3l3MmJcdTAwMjZwdWJsaWNfa2V5PTJuMjQ3ZHY4OWJxOXZtcHIiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvMzQ4cGs5Y2dmM2JneXcyYi9jbGllbnRfYXBpL3YxL2NvbmZpZ3VyYXRpb24iLCJncmFwaFFMIjp7InVybCI6Imh0dHBzOi8vcGF5bWVudHMuc2FuZGJveC5icmFpbnRyZWUtYXBpLmNvbS9ncmFwaHFsIiwiZGF0ZSI6IjIwMTgtMDUtMDgifSwiY2hhbGxlbmdlcyI6W10sImVudmlyb25tZW50Ijoic2FuZGJveCIsImNsaWVudEFwaVVybCI6Imh0dHBzOi8vYXBpLnNhbmRib3guYnJhaW50cmVlZ2F0ZXdheS5jb206NDQzL21lcmNoYW50cy8zNDhwazljZ2YzYmd5dzJiL2NsaWVudF9hcGkiLCJhc3NldHNVcmwiOiJodHRwczovL2Fzc2V0cy5icmFpbnRyZWVnYXRld2F5LmNvbSIsImF1dGhVcmwiOiJodHRwczovL2F1dGgudmVubW8uc2FuZGJveC5icmFpbnRyZWVnYXRld2F5LmNvbSIsImFuYWx5dGljcyI6eyJ1cmwiOiJodHRwczovL29yaWdpbi1hbmFseXRpY3Mtc2FuZC5zYW5kYm94LmJyYWludHJlZS1hcGkuY29tLzM0OHBrOWNnZjNiZ3l3MmIifSwidGhyZWVEU2VjdXJlRW5hYmxlZCI6dHJ1ZSwicGF5cGFsRW5hYmxlZCI6dHJ1ZSwicGF5cGFsIjp7ImRpc3BsYXlOYW1lIjoiQWNtZSBXaWRnZXRzLCBMdGQuIChTYW5kYm94KSIsImNsaWVudElkIjpudWxsLCJwcml2YWN5VXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3BwIiwidXNlckFncmVlbWVudFVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS90b3MiLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOnRydWUsImVudmlyb25tZW50Tm9OZXR3b3JrIjp0cnVlLCJlbnZpcm9ubWVudCI6Im9mZmxpbmUiLCJ1bnZldHRlZE1lcmNoYW50IjpmYWxzZSwiYnJhaW50cmVlQ2xpZW50SWQiOiJtYXN0ZXJjbGllbnQzIiwiYmlsbGluZ0FncmVlbWVudHNFbmFibGVkIjp0cnVlLCJtZXJjaGFudEFjY291bnRJZCI6ImFjbWV3aWRnZXRzbHRkc2FuZGJveCIsImN1cnJlbmN5SXNvQ29kZSI6IlVTRCJ9LCJtZXJjaGFudElkIjoiMzQ4cGs5Y2dmM2JneXcyYiIsInZlbm1vIjoib2ZmIn0=";

  payNow() async {
    BraintreePayment braintreePayment = new BraintreePayment();
    var data = await braintreePayment.showDropIn(
        nonce: clientNonce, amount: "2.0", enableGooglePay: true);
    print("Response of the payment $data");
  }

  void _cardEntryComplete() {}

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);
    InAppPayments.completeCardEntry(onCardEntryComplete: _cardEntryComplete);
  }

  void _cardEntryCancel() {}

  void _pay() {
    InAppPayments.setSquareApplicationId('sq0idb-cznxnqxrY2GLEmOrmI7a6Q');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel);
  }

  @override
  Widget build(BuildContext context) {
    double _gridSize = MediaQuery.of(context).size.height * 0.88;

    return new Container(
        height: MediaQuery.of(context).size.height,
        child: new Stack(children: <Widget>[
          new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            new StreamBuilder(
                initialData: _cartBloc.currentCart,
                stream: _cartBloc.observableCart,
                builder: (context, AsyncSnapshot<Cart> snapshot) {
                  return new Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: _gridSize,
                      width: double.infinity,
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                                padding: EdgeInsets.symmetric(vertical: 40),
                                child: new Text("Cart",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'OpenSansBold',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))),
                            new Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: _gridSize * 0.60,
                                child: new ListView.builder(
                                    itemCount: snapshot.data.orders.length,
                                    itemBuilder: (context, index) {
                                      return Dismissible(
                                        background: Container(
                                            color: Colors.transparent),
                                        key: Key(snapshot.data.orders[index].id
                                            .toString()),
                                        onDismissed: (_) {
                                          _cartBloc.removerOrderOfCart(
                                              snapshot.data.orders[index]);
                                        },
                                        child: new Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: new OrderWidget(
                                                snapshot.data.orders[index],
                                                _gridSize)),
                                      );
                                    })),
                            new Container(
                                height: _gridSize * 0.15,
                                child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text("Total",
                                          style: TextStyle(
                                              color: Colors.yellowAccent[400],
                                              fontFamily: 'OpenSansBold',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                      new Text(
                                          "\฿${snapshot.data.totalPrice().toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: Colors.yellowAccent[400],
                                              fontFamily: 'OpenSansRegular',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30)),
                                    ]))
                          ]));
                })
          ]),
          new Align(
              alignment: Alignment.bottomLeft,
              child: new Container(
                  padding: EdgeInsets.only(left: 10, bottom: _gridSize * 0.02),
                  width: MediaQuery.of(context).size.width - 80,
                  child: new RaisedButton(
                      color: Colors.greenAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {
                        if (_cartBloc.currentCart.isEmpty) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Cart  is  empty !")));
                        } else {
                          _pay(); //_pay or payNow
                        }
                      },
                      child: new Text("Payment  Method",
                          style: TextStyle(
                              fontFamily: 'OpenSansBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20)))))
        ]));
  }
}
