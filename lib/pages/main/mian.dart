import 'package:flutter/material.dart';
import 'package:flutter_news/common/apis/apis.dart';
import 'package:flutter_news/common/entities/categories.dart';
import 'package:flutter_news/common/entities/channels.dart';
import 'package:flutter_news/common/entities/news.dart';
import 'package:flutter_news/pages/main/categories_widget.dart';
import 'package:flutter_news/pages/main/channels_widget.dart';
import 'package:flutter_news/pages/main/recommend_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late NewsPageListResponseEntity _newsPageList; // 新闻翻页
  late NewsItem _newsRecommend; // 新闻推荐
  late List<CategoryResponseEntity> _categories; // 分类
  late List<ChannelResponseEntity> _channels; // 频道
  late String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      cacheDisk: true,
    );
    if (_categories.length > 0) {
      _selCategoryCode = _categories.first.code!;
    }
    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData() {}

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              // _loadNewsData(item.code);
            },
          );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container()
        : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return newsChannelsWidget(
        channels: _channels, onTap: (ChannelResponseEntity item) {});
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
