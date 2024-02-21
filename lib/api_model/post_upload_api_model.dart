class PostUploadAPIModel {
  PostUploadAPIModel({
     this.name,
     this.job,
     this.id,
     this.createdAt,
  });
  late final String? name;
  late final String? job;
  late final String? id;
  late final String? createdAt;

  PostUploadAPIModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job'] = job;
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    return _data;
  }
}