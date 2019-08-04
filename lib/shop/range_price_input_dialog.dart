
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/number_text_input_formatter.dart';
import 'package:flutter_deer/util/toast.dart';
import 'package:flutter_deer/widgets/base_dialog.dart';

class RangePriceInputDialog extends StatefulWidget{

  RangePriceInputDialog({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key : key);

  final String title;
  final Function(String, String) onPressed;
  
  @override
  _RangePriceInputDialog createState() => _RangePriceInputDialog();
  
}

class _RangePriceInputDialog extends State<RangePriceInputDialog>{

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      child: Container(
        height: 34.0,
        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _controller,
                maxLines: 1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // 金额限制数字格式
                inputFormatters: [UsNumberTextInputFormatter()],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 4.0, left: 16.0, right: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("至"),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              color: Colors.white,
              height: double.infinity),
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _controller1,
                maxLines: 1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // 金额限制数字格式
                inputFormatters: [UsNumberTextInputFormatter()],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 4.0, left: 16.0, right: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: (){
        if (_controller.text.isEmpty || _controller1.text.isEmpty){
          Toast.show("请输入${widget.title}");
          return;
        }
        if (double.parse(_controller.text) >= double.parse(_controller1.text)){
          Toast.show("最小金额不能大于最大金额!");
          return;
        }
        widget.onPressed(_controller.text, _controller1.text);
        NavigatorUtils.goBack(context);
      },
    );
  }
}