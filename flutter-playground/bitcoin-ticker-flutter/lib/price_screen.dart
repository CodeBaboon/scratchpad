import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'coin_card.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late String selectedCurrency;
  Map<String, String> rates = {};

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        updateUI(value.toString());
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
      },
      children: items,
    );
  }

  Future<void> updateUI(String currency) async {
    setState(() {
      selectedCurrency = currency;
    });

    for (String coin in cryptoList) {
      updateRate(coin, currency);
    }
  }

  Future<void> updateRate(String coin, String currency) async {
    double rate = await CoinData().getCoinData(
      coin: coin,
      currency: currency,
    );
    setState(() {
      rates[coin] = rate.toInt().toString();
    });
  }

  List<CoinCard> getCoinCards() {
    List<CoinCard> cards = [];

    for (var coin in cryptoList) {
      cards.add(
        CoinCard(
          coin: coin,
          currency: selectedCurrency,
          rate: rates[coin] ?? '?',
        ),
      );
    }

    return cards;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI('USD');
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
          Column(
            children: getCoinCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
