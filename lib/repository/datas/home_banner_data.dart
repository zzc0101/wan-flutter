class HomeBannerListData {
  List<HomeBannerData?>? bannerList;

  HomeBannerListData.fromJson(dynamic json) {
    if (json is List) {
      bannerList = [];
      json.forEach((element) {
        bannerList?.add(HomeBannerData.fromJson(element));
      });
    }
  }
}

class HomeBannerData {
  HomeBannerData({
    String? desc,
    num? id,
    String? imagePath,
    num? isVisible,
    num? order,
    String? title,
    num? type,
    String? url,
  }) {
    _desc = desc;
    _id = id;
    _imagePath = imagePath;
    _isVisible = isVisible;
    _order = order;
    _title = title;
    _type = type;
    _url = url;
  }

  HomeBannerData.fromJson(dynamic json) {
    _desc = json['desc'];
    _id = json['id'];
    _imagePath = json['imagePath'];
    _isVisible = json['isVisible'];
    _order = json['order'];
    _title = json['title'];
    _type = json['type'];
    _url = json['url'];
  }

  String? _desc;
  num? _id;
  String? _imagePath;
  num? _isVisible;
  num? _order;
  String? _title;
  num? _type;
  String? _url;

  String? get desc => _desc;

  num? get id => _id;

  String? get imagePath => _imagePath;

  num? get isVisible => _isVisible;

  num? get order => _order;

  String? get title => _title;

  num? get type => _type;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = _desc;
    map['id'] = _id;
    map['imagePath'] = _imagePath;
    map['isVisible'] = _isVisible;
    map['order'] = _order;
    map['title'] = _title;
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }
}
