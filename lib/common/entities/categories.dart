class CategoryResponseEntity {
  CategoryResponseEntity({
    this.code,
    this.title,
  });

  String? code;
  String? title;

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) => CategoryResponseEntity(
    code: json["code"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
  };
}
