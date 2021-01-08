import 'package:flutter/material.dart';

/// 外から Widget のインスタンスを渡してリビルドを回避するパターンのサンプル
class UseInjectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('外からインスタンスを渡す例')),
      body: LabeledCounter(
        label: SomeFixedWidget(), // ここで [SomeFixedWidget] インスタンスを生成して渡す
      ),
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
  // リビルドさせたくない Widget を外から受け取る
  final Widget label;

  const LabeledCounter({Key key, this.label}) : super(key: key);

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
          widget.label, // 外から受け取った Widget を使い回す
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
