import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/pages/main/mian.dart';
// import 'package:flutter_news/pages/account/account.dart';
// import 'package:flutter_news/pages/bookmarks/bookmarks.dart';
// import 'package:flutter_news/pages/category/category.dart';
// import 'package:flutter_news/pages/main/main.dart';

class Application extends StatefulWidget {
  Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = [
    'Welcome',
    'Cagegory',
    'Bookmarks',
    'Account'
  ];
  // 页控制器
  late final PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.secondaryElementText,
      ),
      label: 'main',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColors.secondaryElementText,
      ),
      label: 'category',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColors.secondaryElementText,
      ),
      label: 'tag',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.me,
        color: AppColors.secondaryElementText,
      ),
      label: 'my',
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

//  顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: AppColors.primaryText,
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),

    );
  }
  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        Text("CategoryPage"),
        Text("BookmarksPage"),
        Text("AccountPage"),
        // MainPage(),
        // CategoryPage(),
        // BookmarksPage(),
        // AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }
  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


}

