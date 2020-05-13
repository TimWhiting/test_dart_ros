import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart';

void main(List<String> args) {
  //TODO: Change to node handle
  final node = Node('test_node');
  final sub = node.subscribe<StringMessage>('/chatter', std_msgs.StringMessage,
      (StringMessage result) {
    print(result);
  });
}
