import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart';

void main(List<String> args) async {
  //TODO: Change to node handle
  final node = await initNode('test_node', args);
  final sub = node.subscribe<StringMessage>('/chatter', std_msgs.StringMessage,
      (StringMessage result) {
    print(result);
  });
}
