import 'package:dartx/dartx.dart';
import 'package:dartros/dartros.dart';

import '../lib/msgs.dart';

class CoffeeServer {
  late final SimpleActionServer<CoffeeGoal, CoffeeActionGoal, CoffeeFeedback,
      CoffeeActionFeedback, CoffeeResult, CoffeeActionResult> _server;

  CoffeeServer(NodeHandle nh) {
    _server = SimpleActionServer(
      '/coffee',
      nh,
      CoffeeAction.$prototype,
      execute,
    );
  }

  Future<void> execute(CoffeeGoal? goal) async {
    if (goal == null) {
      return;
    }
    final spec = goal.spec;
    print('Goal: ${spec.mass} g of ${spec.name} ground at ${spec.grind_size}');
    final stepDuration = 1.seconds;
    final stopwatch = Stopwatch()..start();
    double mass = 0;
    while (mass < spec.mass) {
      if (_server.isPreemptRequested) {
        print('Goal preempted!');
        _server.setPreempted(null, 'Preempted...');
        return;
      }

      print('Brewing, mass $mass...');
      await Future.delayed(stepDuration);
      mass += 5;
      final fb = CoffeeFeedback(mass: mass);
      _server.publishFeedbackForGoal(fb);
    }

    final duration = stopwatch.elapsed;
    final secs = duration.inSeconds;
    final nsecs = (duration.inMicroseconds - 1000000 * secs) * 1000;
    final rosTime = RosTime(secs: secs, nsecs: nsecs);
    _server.setSucceeded(CoffeeResult(mass: mass, duration: rosTime), '');
  }

  void start() => _server.start();
  Future<void> shutdown() => _server.shutdown();
}

Future<void> main(List<String> args) async {
  final nh = await initNode('coffee_server', args, anonymize: true);
  final server = CoffeeServer(nh);

  server.start();

  for (;;) {
    await Future.delayed(1.seconds);
  }

  await server.shutdown();
  await nh.node.shutdown();
}
