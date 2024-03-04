import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:ott_code_frontend/common/color_extension.dart';
import 'package:ott_code_frontend/view/home/home_view.dart';

class MainTabBarView extends StatefulWidget {
  const MainTabBarView({super.key});

  @override
  State<MainTabBarView> createState() => _MainTabBarViewState();
}

class _MainTabBarViewState extends State<MainTabBarView>
    with TickerProviderStateMixin {
  TabController? tabController;
  int selectedTab = 0;
  @override
  void initState() {
    super.initState();
    // 4 tabs => Home ,Search , download , user profile
    tabController = TabController(length: 4, vsync: this);
    tabController?.addListener(() {
      selectedTab = tabController?.index ?? 0;
      if (mounted) {
        setState(() {});
      }
    });

    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [const HomeView(), Container(), Container(), Container()],
      ),
      backgroundColor: ApplicationColor.bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ApplicationColor.primaryColor,
        onPressed: () {
          ApplicationColor.themeModeDark = !ApplicationColor.themeModeDark;
          FBroadcast.instance().broadcast("change_mode");
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          ApplicationColor.themeModeDark ? Icons.light_mode : Icons.dark_mode,
          color: ApplicationColor.text,
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(color: ApplicationColor.bgColor, boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -3),
          ),
        ]),
        child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: TabBar(
              indicatorWeight: 0.1,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              labelStyle: TextStyle(
                  color: ApplicationColor.subText,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
              unselectedLabelStyle: TextStyle(
                  color: ApplicationColor.primaryColor2,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
              unselectedLabelColor: ApplicationColor.subText,
              labelColor: ApplicationColor.primaryColor,
              controller: tabController,
              tabs: [
                Tab(
                  text: "Home",
                  icon: Image.asset(
                    "assets/images/tab_home.png",
                    width: 30,
                    height: 30,
                    color: selectedTab == 0
                        ? ApplicationColor.primaryColor2
                        : ApplicationColor.subText,
                  ),
                ),
                Tab(
                  text: "Search",
                  icon: Image.asset(
                    "assets/images/tab_search-2.png",
                    width: 30,
                    height: 30,
                    color: selectedTab == 1
                        ? ApplicationColor.primaryColor2
                        : ApplicationColor.subText,
                  ),
                ),
                Tab(
                  text: "Download",
                  icon: Image.asset(
                    "assets/images/tab_download.png",
                    width: 30,
                    height: 30,
                    color: selectedTab == 2
                        ? ApplicationColor.primaryColor2
                        : ApplicationColor.subText,
                  ),
                ),
                Tab(
                  text: "Profile",
                  icon: Image.asset(
                    "assets/images/tab_user.png",
                    width: 30,
                    height: 30,
                    color: selectedTab == 3
                        ? ApplicationColor.primaryColor2
                        : ApplicationColor.subText,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
