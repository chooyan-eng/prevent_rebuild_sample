import 'package:flutter/material.dart';

/// State でのキャッシュでリビルドを回避するパターンのサンプル
class UseCachePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State でキャッシュする例')),
      body: LabeledCounter(),
    );
  }
}

/// リビルドを発生させたくない Widget
class SomeFixedWidget extends StatelessWidget {
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

  // State のフィールドで Widget のインスタンスを生成しておく
  final _widgetCache = SomeFixedWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _widgetCache, // _widgetCache を使い回す
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
