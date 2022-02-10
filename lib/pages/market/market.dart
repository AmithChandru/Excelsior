import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  const Market({Key key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Market is up 3.86% today',
            style: TextStyle(
              fontSize: 16.0,
              color: greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: primaryColor,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Watchlist'),
              Tab(text: 'Top Gainers'),
              Tab(text: 'Top Losers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllCurrency(),
            WatchList(),
            TopGainer(),
            TopLoser(),
          ],
        ),
      ),
    );
  }
}
