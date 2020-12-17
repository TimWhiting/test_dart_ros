import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart' as msgs;

Future<void> main(List<String> args) async {
  //TODO: Change to node handle
  final node = await initNode('test_node', args);
  final str_msg = msgs.StringMessage(data: 'hello');
  final pub = node.advertise<msgs.StringMessage>('/chatter', msgs.StringMessage.$prototype);
  for (;;) {
    pub.publish(str_msg, 1);
    await Future.delayed(Duration(seconds:1));
  }

}
