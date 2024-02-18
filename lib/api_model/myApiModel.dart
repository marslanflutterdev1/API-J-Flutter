class MYAPIMODEL {
List<dynamic> sub;
  MYAPIMODEL({required this.sub});

  factory MYAPIMODEL.MyJson(Map<String, dynamic> putJson) {
    return MYAPIMODEL(sub: putJson["subjects"]);
  }
}
