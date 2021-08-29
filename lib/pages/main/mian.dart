import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    ...
  }

  // 分类菜单
  Widget _buildCategories() {
    return Container();
  }
  // 抽取前先实现业务

  // 推荐阅读
  Widget _buildRecommend() {
    return Container();
  }

  // 频道
  Widget _buildChannels() {
    return Container();
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container();
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
