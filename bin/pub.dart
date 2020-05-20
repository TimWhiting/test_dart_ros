import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart';

void main(List<String> args) async {
  //TODO: Change to node handle
  final node = await initNode('test_node', args);
  final str_msg = StringMessage(data: 'hello');
  final pub = node.advertise<StringMessage>('/chatter', std_msgs.StringMessage);
  pub.publish(str_msg, 0);
}
