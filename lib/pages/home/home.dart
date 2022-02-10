import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final portfolioItem = [
    {
      'name': 'BTC',
      'image': 'assets/crypto_icon/btc.png',
      'value': '\$1,45,250',
      'status': 'up',
      'change': '20%',
    },
    {
      'name': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$2,50,245',
      'status': 'down',
      'change': '3%',
    }
  ];

  final popularCurrencyList = [
    {
      'name': 'Bitcoin',
      'shortName': 'BTC',
      'image': 'assets/crypto_icon/btc.png',
      'value': '\$10,136.73',
      'status': 'up',
      'change': '4.72%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$185.65',
      'status': 'up',
      'change': '6.86%'
    },
    {
      'name': 'XRP',
      'shortName': 'XRP',
      'image': 'assets/crypto_icon/xrp.png',
      'value': '\$0.262855',
      'status': 'down',
      'change': '8.95%'
    },
    {
      'name': 'Bitcoin Cash',
      'shortName': 'BCH',
      'image': 'assets/crypto_icon/bch.png',
      'value': '\$297.98',
      'status': 'up',
      'change': '4.55%'
    },
    {
      'name': 'Litecoin',
      'shortName': 'LTC',
      'image': 'assets/crypto_icon/ltc.png',
      'value': '\$71.24',
      'status': 'up',
      'change': '7.12%'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          userGreeting(),
          balanceContainer(),
          height20Space,
          myPortfolio(),
          height20Space,
          popularCurrency(),
        ],
      ),
    );
  }

  userGreeting() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: grey16MediumTextStyle,
              ),
              heightSpace,
              Text(
                'Peter Jones',
                style: black22BoldTextStyle,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(index: 4),
                ),
              );
            },
            borderRadius: BorderRadius.circular(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/user/user_14.jpg',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  balanceContainer() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: white16MediumTextStyle,
          ),
          heightSpace,
          Text(
            '\$4,50,933',
            style: white36BoldTextStyle,
          ),
          height20Space,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly profit',
                    style: white16MediumTextStyle,
                  ),
                  heightSpace,
                  Text(
                    '\$12,484',
                    style: white26BoldTextStyle,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(fixPadding * 0.7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: whiteColor.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up,
                      size: 26.0,
                      color: whiteColor,
                    ),
                    Text(
                      '+10%',
                      style: white14MediumTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  myPortfolio() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: fixPadding * 2.0,
            bottom: fixPadding,
          ),
          child: Text(
            'My Portfolio',
            style: black18SemiBoldTextStyle,
          ),
        ),
        Container(
          width: double.infinity,
          height: 178.0,
          child: ListView.builder(
            itemCount: portfolioItem.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = portfolioItem[index];

              return Padding(
                padding: (index != portfolioItem.length - 1)
                    ? EdgeInsets.only(left: fixPadding * 2.0)
                    : EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: 220.0,
                    padding: EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image'],
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                            widthSpace,
                            Text(
                              item['name'],
                              style: black16MediumTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Portfolio',
                              style: grey16MediumTextStyle,
                            ),
                            heightSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item['value'],
                                  style: black22BoldTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (item['status'] == 'up')
                                        ? Icon(
                                            Icons.arrow_drop_up,
                                            size: 26.0,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down,
                                            size: 26.0,
                                            color: redColor,
                                          ),
                                    Text(
                                      '${((item['status'] == 'up') ? '+' : '-')}${item['change']}',
                                      style: (item['status'] == 'up')
                                          ? primaryColor16MediumTextStyle
                                          : red16MediumTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  popularCurrency() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Popular Currencies',
                style: black18SemiBoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(index: 2),
                    ),
                  );
                },
                child: Text(
                  'See More',
                  style: primaryColor16MediumTextStyle,
                ),
              ),
            ],
          ),
        ),
        ColumnBuilder(
          itemCount: popularCurrencyList.length,
          itemBuilder: (context, index) {
            final item = popularCurrencyList[index];
            return Padding(
              padding: (index != popularCurrencyList.length - 1)
                  ? EdgeInsets.fromLTRB(
                      fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
                  : EdgeInsets.all(fixPadding * 2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.size,
                          alignment: Alignment.center,
                          child: CurrencyScreen()));
                },
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        color: blackColor.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['image'],
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                      widthSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: black14MediumTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['shortName'],
                                      style: black12RegularTextStyle,
                                    ),
                                    widthSpace,
                                    (item['status'] == 'up')
                                        ? Icon(
                                            Icons.arrow_drop_up,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down,
                                            color: redColor,
                                          ),
                                    Text(
                                      item['change'],
                                      style: black12RegularTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              item['value'],
                              style: black16MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
