import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart';

void main(List<String> args) async {
  final nh = await initNode('test_node', args, anonymize: true);
  final _ = nh.subscribe<StringMessage>('/chatter', StringMessage.$prototype,
      (StringMessage result) {
    print(result);
  });
}
