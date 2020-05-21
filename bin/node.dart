import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:buffer/buffer.dart';
import 'package:dartros/dartros.dart';
import 'package:std_msgs/msgs.dart';
import 'package:dartros/src/utils/tcpros_utils.dart';

void main(List<String> args) async {
  final node = await initNode('test_node', args);
  final str_msg = StringMessage(data: 'hello');

  final writer = ByteDataWriter(endian: Endian.little);
  createPubHeader(writer, '/rostopic_4767_1316912741557', str_msg.md5sum,
      str_msg.fullType, true, str_msg.messageDefinition);
  serializeMessage(writer, str_msg);
  print(HEX.encode(writer.toBytes().toList()));
  final reader = ByteDataReader(endian: Endian.little);
  reader.add(writer.toBytes());
  // final header = parseTcpRosHeader(reader);
  // print(header);
  // final message = deserializeMessage<StringMessage>(reader);
  // print(message.data);
}
