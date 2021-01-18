import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ImageGridViewRoute'),
          leading: IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () => Navigator.pop(context)),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            // height: 150.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index_list) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 14),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 14, left: 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('날짜 2020년 1월 15일_${index_list}',
                                    style: TextStyle(
                                        fontSize: 13)),
                              )),
                          GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10,
                                bottom: 20),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: index_list,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, int index_grid) {
                              return Container(
                                color: Colors.grey[300],
                                child: Center(
                                  child: Text('index_grid ${index_grid}'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
