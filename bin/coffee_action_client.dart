import 'package:dartros/dartros.dart';

import '../lib/msgs.dart';

Future<void> main(List<String> args) async {
  final nh = await initNode('coffee_client', args, anonymize: true);

  final ac = SimpleActionClient('/coffee', nh, CoffeeAction.$prototype);

  print('Waiting for action server...');
  final ready = await ac.waitForServer(10000);
  print('Action server ready: $ready');

  final spec = CoffeeSpec(name: 'Best brand', grind_size: 13, mass: 25);
  final goal = CoffeeGoal(spec: spec);
  ac.sendSimpleGoal(
    goal,
    (msg) => print(
        'Goal feedback: status ${msg.status.status}, mass ${msg.feedback.mass}'),
    () => print('Goal active!'),
    (state, result) => print('Goal finished: state $state'),
  );

  print('Waiting for result...');
  final goalDone = await ac.waitForResult(RosTime(secs: 100));
  print('Goal done: $goalDone');

  final result = ac.getResult();
  print('Result: brewed ${result?.mass} g in ${result?.duration?.secs} s');

  await ac.shutdown();
  await nh.node.shutdown();
}
