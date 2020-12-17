// Auto-generated. Do not edit!

// Updated: Thu Dec 17 15:41:05 2020

// (in-package test_dart.msg)


import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class CoffeeSpec extends RosMessage<CoffeeSpec> {
  String name;

  double grind_size;

  double mass;

  static CoffeeSpec $prototype = CoffeeSpec();
  CoffeeSpec({ 
    String name,
    double grind_size,
    double mass,
  }):
  this.name = name ?? '',
  this.grind_size = grind_size ?? 0.0,
  this.mass = mass ?? 0.0;

  CoffeeSpec call({ 
    String name,
    double grind_size,
    double mass,
  }) => CoffeeSpec(
  name: name,
  grind_size: grind_size,
  mass: mass,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type CoffeeSpec
    // Serialize message field [name]
    writer.writeString(name);
    // Serialize message field [grind_size]
    writer.writeFloat32(grind_size);
    // Serialize message field [mass]
    writer.writeFloat32(mass);
  }

  @override
  CoffeeSpec deserialize(ByteDataReader reader) {
    //deserializes a message object of type CoffeeSpec
    final data = CoffeeSpec();
    // Deserialize message field [name]
    data.name = reader.readString();
    // Deserialize message field [grind_size]
    data.grind_size = reader.readFloat32();
    // Deserialize message field [mass]
    data.mass = reader.readFloat32();
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += utf8.encode(name).length;
    return length + 12;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'test_dart/CoffeeSpec';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'b41fc6a4675039a1c6867ae314806e80';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''string name
float32 grind_size
float32 mass

''';
  }

}

