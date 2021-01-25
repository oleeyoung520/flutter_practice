import 'package:flutter/material.dart';
import 'ImageGridViewRoute.dart';
import 'LoginFormRoute.dart';
import 'MethodChannelRoute.dart';

class MainNavigationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final List<String> routerNameList = ['LoginFormRoute', 'ImageGridViewRoute', 'MethodChannelRoute'];
    final List<Widget> routerList = [LoginFormRoute(), ImageGridViewRoute(), MethodChannelRoute()];

    void NavigateFunction(Widget widget) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => widget));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Navigation Route'),
      ),
        body: Center(
            child: GridView.builder(
              padding: EdgeInsets.all(30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: (itemHeight / itemWidth),
                ),
                itemCount: routerNameList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue,
                    child: RaisedButton(
                      onPressed: () {
                        NavigateFunction(routerList[index]);
                      },
                      child: Text('${routerNameList[index]}')
                    ),
                  );
                })));
  }


}


