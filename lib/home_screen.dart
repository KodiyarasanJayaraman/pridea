import 'package:flutter/material.dart';
import 'package:pridea/widgets.dart';

import 'buy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Container(
                height: 209,
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 50),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        stops: const [
                      0.1,
                      .5,
                      2,
                    ],
                        colors: [
                      HexColor("#1B2047").withOpacity(.9),
                      HexColor("#030A49CC").withOpacity(.79),
                      HexColor("#2C2D57").withOpacity(.85),
                    ])),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            )),
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              'assets/logo.png',
                              width: 107,
                              height: 37,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 37,
                        ),
                        TabBar(
                            dividerHeight: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            indicatorColor: Colors.white,
                            controller: tabController,
                            tabs: const [
                              TextWidget(
                                text: 'Buy',
                                color: Colors.white,
                              ),
                              TextWidget(
                                text: 'Rent',
                                color: Colors.white,
                              ),
                            ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                          margin: const EdgeInsets.only(left: 12, right: 2),
                          padding: const EdgeInsets.only(
                              left: 22, right: 32, top: 42),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor('#00000040').withOpacity(.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: tabController,
                            children: const [
                              ByeTabView(),
                              Center(
                                child: Text('Rent'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 59,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(color: AppColor.primaryBlue),
                  padding: const EdgeInsets.only(left: 80),
                  alignment: Alignment.centerLeft,
                  child: const TextWidget(
                    text: 'SEARCH',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 59,
                  width: 180,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: HexColor('#00000040').withOpacity(.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ], color: Colors.white),
                  padding: const EdgeInsets.only(left: 80),
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'CLEAR',
                    color: HexColor('#2A2F5F'),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
