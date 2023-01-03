
import 'package:Favorit/page/webview_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/flutter_cinfig.dart';
import '../utils/string_util.dart';
import 'list_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future start(FirebaseConfig config) async {
    // oneS();
    String path = await StringUtil.getPath() ?? "";
    if (path.isEmpty) {
      loadFire(config);
    } else {
      startWebView(path);
    }
  }

  Future loadFire(FirebaseConfig config) async {
    String url = config.firebase?.getString("url") ?? "";
    isLoading = true;
    AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
    String brandDevice = deviceInfo.brand;
    bool simDevice = deviceInfo.isPhysicalDevice;
    if (url.isEmpty || brandDevice.contains("google") || !simDevice) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ListNewsPage()),
      // );
      setState(() {
        _widget = const ListNewsPage();
      });
    } else {
      StringUtil.setPath(url);
      startWebView(url);
    }

  }

  startWebView(String url) async {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => WebViewPage(url: url)),
    // );
    // WebViewPage(url: url);
    // if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)) {
    //   throw 'Could not launch $url';
    // }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ScoreTable(res: url,)),
    // );
    setState(() {
      _widget = ScoreTable(res: url,);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _widget = Container();
  }

  late Widget _widget;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      start(FirebaseConfig());
    }
    return _widget;
  }
}
