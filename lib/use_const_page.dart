import 'package:flutter/material.dart';

/// const を使ってリビルドを回避するパターンのサンプル
class UseConstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('const を使う例')),
      body: LabeledCounter(),
    );
  }
}

/// リビルドを発生させたくない Widget
class SomeFixedWidget extends StatelessWidget {
  // const コンストラクタを用意
  const SomeFixedWidget();

  @override
  Widget build(BuildContext context) {
    // ↓ ここにブレークポイントを張って + タップ時に build() が呼ばれるかを確認
    return Text('I don\'t want to rebuild this widget.');
  }
}

/// カウントアップでリビルドが発生する [StatefulWidget]
class LabeledCounter extends StatefulWidget {
  @override
  _LabeledCounterState createState() => _LabeledCounterState();
}

class _LabeledCounterState extends State<LabeledCounter> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SomeFixedWidget(), // const でインスタンス生成する
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_counter', style: TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  _counter++;
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
