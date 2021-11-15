import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

// import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dollerPrice;
  String selectedCurrency = 'USD';

  // String PriceChecker(String fiat, String crypto) {
  //
  Future<String> PriceChecker(var selectedCurrency) async {
    CoinData btctousd = CoinData(
        'https://api.nomics.com/v1/currencies/ticker?key=3db103ef8cc6cba1c93f75f81c5e1d8c5f5482ad&ids=BTC&convert=$selectedCurrency');
    // return Text(
    //   '65000.45'
    // );
    var jsonData = await btctousd.getData();
    return dollerPrice = jsonData[0]['price'];
  }

  DropdownButton<String> androidDropDownList() {
    List<DropdownMenuItem<String>> dropDownItemList = [];
    for (String currencyItems in currenciesList) {
      var item =
          DropdownMenuItem(child: Text(currencyItems), value: currencyItems);
      dropDownItemList.add(item);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItemList,
        onChanged: (selectItem) async {
          var currency = await PriceChecker(selectItem);
          // print(dropDownItemList[currency]);
          setState(() {
            selectedCurrency = selectItem;
            dollerPrice = currency;
          });
        });
  }

  CupertinoPicker iosPicker() {
    List<Text> iosItemList = [];

    for (String i in currenciesList) {
      var item = Text(i);
      iosItemList.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      children: iosItemList,
      onSelectedItemChanged: (item) async {
        print(iosItemList[item]);

        var doller = await PriceChecker(selectedCurrency);
        setState(() {
          dollerPrice = doller;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    PriceChecker(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $dollerPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // child: Platform.isIOS ? iosPicker() : androidDropDownList(),
            child: androidDropDownList(),
          ),
        ],
      ),
    );
  }
}
