
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/toast.dart';
import 'package:flutter_deer/widgets/my_button.dart';
import 'package:flutter_deer/widgets/selected_image.dart';
import 'package:flutter_deer/widgets/text_field_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/widgets/app_bar.dart';

class GoodsSizeEdit extends StatefulWidget {
  
  @override
  _GoodsSizeEditState createState() => _GoodsSizeEditState();
}

class _GoodsSizeEditState extends State<GoodsSizeEdit> {

  File _imageFile;

  void _getImage() async{
    try {
      _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {});
    } catch (e) {
      Toast.show("没有权限，无法打开相册！");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "规格分类",
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Gaps.vGap5,
                    const Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: const Text("基本信息", style: TextStyles.textBoldDark18),
                    ),
                    Gaps.vGap16,
                    Center(
                      child: SelectedImage(
                        size: 96.0,
                        image: _imageFile,
                        onTap: _getImage
                      ),
                    ),
                    Gaps.vGap8,
                    const Center(
                      child: const Text(
                        "点击添加分类图片",
                        style: TextStyles.textGray14,
                      ),
                    ),
                    Gaps.vGap16,
                    TextFieldItem(
                      title: "分类名称",
                      hintText: "填写该分类名称",
                    ),
                    TextFieldItem(
                      title: "折后价格",
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      hintText: "填写该分类折后价格",
                    ),
                    TextFieldItem(
                      title: "库存数量",
                      hintText: "填写该分类库存数量",
                      keyboardType: TextInputType.number
                    ),
                    TextFieldItem(
                      title: "佣金金额",
                      keyboardType: TextInputType.numberWithOptions(decimal: true)
                    ),
                    TextFieldItem(
                      title: "起购数量",
                      keyboardType: TextInputType.number
                    ),
                    Gaps.vGap16,
                    Gaps.vGap16,
                    const Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: const Text("折扣立减", style: TextStyles.textBoldDark18),
                    ),
                    Gaps.vGap16,
                    TextFieldItem(
                      title: "立减金额",
                      keyboardType: TextInputType.number
                    ),
                    TextFieldItem(
                      title: "抵扣金额",
                      keyboardType: TextInputType.number
                    ),
                    Gaps.vGap8,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: MyButton(
                onPressed: (){
                  NavigatorUtils.goBack(context);
                },
                text: "确定",
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
