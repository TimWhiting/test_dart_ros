// Auto-generated. Do not edit!

// Updated: Mon Feb  1 12:03:00 2021

// (in-package test_dart.msg)


// ignore_for_file: unused_import, overridden_fields
import 'CoffeeGoal.dart';
import 'CoffeeFeedback.dart';
import 'CoffeeResult.dart';
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';
import 'CoffeeActionGoal.dart';
import 'CoffeeActionResult.dart';
import 'CoffeeActionFeedback.dart';

//-----------------------------------------------------------

class CoffeeAction extends RosActionMessage<CoffeeGoal, CoffeeActionGoal, CoffeeFeedback, CoffeeActionFeedback, CoffeeResult, CoffeeActionResult> {
  CoffeeActionGoal action_goal;

  CoffeeActionResult action_result;

  CoffeeActionFeedback action_feedback;

  static CoffeeAction $prototype = CoffeeAction();
  CoffeeAction({ 
    CoffeeActionGoal? action_goal,
    CoffeeActionResult? action_result,
    CoffeeActionFeedback? action_feedback,
  }):
  this.action_goal = action_goal ?? CoffeeActionGoal(),
  this.action_result = action_result ?? CoffeeActionResult(),
  this.action_feedback = action_feedback ?? CoffeeActionFeedback();

  @override
  CoffeeAction call({ 
    CoffeeActionGoal? action_goal,
    CoffeeActionResult? action_result,
    CoffeeActionFeedback? action_feedback,
  }) => CoffeeAction(
  action_goal: action_goal,
  action_result: action_result,
  action_feedback: action_feedback,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type CoffeeAction
    // Serialize message field [action_goal]
    action_goal.serialize(writer);
    // Serialize message field [action_result]
    action_result.serialize(writer);
    // Serialize message field [action_feedback]
    action_feedback.serialize(writer);
  }

  @override
  CoffeeAction deserialize(ByteDataReader reader) {
    //deserializes a message object of type CoffeeAction
    final data = CoffeeAction();
    // Deserialize message field [action_goal]
    data.action_goal = CoffeeActionGoal.$prototype.deserialize(reader);
    // Deserialize message field [action_result]
    data.action_result = CoffeeActionResult.$prototype.deserialize(reader);
    // Deserialize message field [action_feedback]
    data.action_feedback = CoffeeActionFeedback.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += action_goal.getMessageSize();
    length += action_result.getMessageSize();
    length += action_feedback.getMessageSize();
    return length;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'test_dart/CoffeeAction';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '5f6eea1167d357aa9ca3fcd25fd92459';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

CoffeeActionGoal action_goal
CoffeeActionResult action_result
CoffeeActionFeedback action_feedback

================================================================================
MSG: test_dart/CoffeeActionGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalID goal_id
CoffeeGoal goal

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: actionlib_msgs/GoalID
# The stamp should store the time at which this goal was requested.
# It is used by an action server when it tries to preempt all
# goals that were requested before a certain time
time stamp

# The id provides a way to associate feedback and
# result message with specific goal requests. The id
# specified must be unique.
string id


================================================================================
MSG: test_dart/CoffeeGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal definition
CoffeeSpec spec

================================================================================
MSG: test_dart/CoffeeSpec
string name
float32 grind_size
float32 mass

================================================================================
MSG: test_dart/CoffeeActionResult
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalStatus status
CoffeeResult result

================================================================================
MSG: actionlib_msgs/GoalStatus
GoalID goal_id
uint8 status
uint8 PENDING         = 0   # The goal has yet to be processed by the action server
uint8 ACTIVE          = 1   # The goal is currently being processed by the action server
uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing
                            #   and has since completed its execution (Terminal State)
uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)
uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due
                            #    to some failure (Terminal State)
uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,
                            #    because the goal was unattainable or invalid (Terminal State)
uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing
                            #    and has not yet completed execution
uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,
                            #    but the action server has not yet confirmed that the goal is canceled
uint8 RECALLED        = 8   # The goal received a cancel request before it started executing
                            #    and was successfully cancelled (Terminal State)
uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be
                            #    sent over the wire by an action server

#Allow for the user to associate a string with GoalStatus for debugging
string text


================================================================================
MSG: test_dart/CoffeeResult
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#result definition
float32 mass
duration duration

================================================================================
MSG: test_dart/CoffeeActionFeedback
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalStatus status
CoffeeFeedback feedback

================================================================================
MSG: test_dart/CoffeeFeedback
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
float32 mass


''';
  }

  @override
  CoffeeGoal get goal => CoffeeGoal.$prototype;

  @override
  CoffeeActionGoal get actionGoal => CoffeeActionGoal.$prototype;

  @override
  CoffeeFeedback get feedback => CoffeeFeedback.$prototype;

  @override
  CoffeeActionFeedback get actionFeedback => CoffeeActionFeedback.$prototype;

  @override
  CoffeeResult get result => CoffeeResult.$prototype;

  @override
  CoffeeActionResult get actionResult => CoffeeActionResult.$prototype;

}

