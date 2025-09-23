import 'dart:convert';
import 'package:nebx_flutter_template/infrastructure/interfaces/decoder.dart';
import 'package:xml2json/xml2json.dart';

class DecoderImpl implements IDecoder {
  final Xml2Json _xmlParser;

  DecoderImpl() : _xmlParser = Xml2Json();

  @override
  dynamic xml(String content) {
    _xmlParser.parse(content);
    final mapData = _xmlParser.toParker();
    return jsonDecode(mapData);
  }

  @override
  dynamic json(String content) => jsonDecode(content);
}
