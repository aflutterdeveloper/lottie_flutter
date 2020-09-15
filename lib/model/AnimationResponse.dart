import 'package:autility/utility/serializable.dart';

class AnimationResponse {
  int currentPage;
  List<AnimationData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  AnimationResponse(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  AnimationResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<AnimationData>();
      json['data'].forEach((v) {
        data.add(new AnimationData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class AnimationData {
  int id;
  String slug;
  String fileContentHash;
  String title;
  String description;
  String preview;
  String bgColor;
  int speed;
  int downloads;
  int views;
  int aepFlag;
  String bodymovinVersion;
  String dotlottieFile;
  dynamic packageType;
  int isSticker;
  int status;
  String updatedAt;
  int inProcess;
  String lottieLink;
  String filetype;
  int aepFile;
  UserInfo userInfo;
  String file;
  String previewUrl;
  dynamic previewVideoUrl;
  dynamic baseprice;
  dynamic entryLicense;

  AnimationData(
      {this.id,
        this.slug,
        this.fileContentHash,
        this.title,
        this.description,
        this.preview,
        this.bgColor,
        this.speed,
        this.downloads,
        this.views,
        this.aepFlag,
        this.bodymovinVersion,
        this.dotlottieFile,
        this.packageType,
        this.isSticker,
        this.status,
        this.updatedAt,
        this.inProcess,
        this.lottieLink,
        this.filetype,
        this.aepFile,
        this.userInfo,
        this.file,
        this.previewUrl,
        this.previewVideoUrl,
        this.baseprice,
        this.entryLicense});

  AnimationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    fileContentHash = json['file_content_hash'];
    title = json['title'];
    description = json['description'];
    preview = json['preview'];
    bgColor = json['bg_color'];
    speed = json['speed'];
    downloads = json['downloads'];
    views = json['views'];
    aepFlag = json['aep_flag'];
    bodymovinVersion = json['bodymovin_version'];
    dotlottieFile = json['dotlottie_file'];
    packageType = json['package_type'];
    isSticker = json['is_sticker'];
    status = json['status'];
    updatedAt = json['updated_at'];
    inProcess = json['in_process'];
    lottieLink = json['lottie_link'];
    filetype = json['filetype'];
    aepFile = json['aep_file'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    file = json['file'];
    previewUrl = json['preview_url'];
    previewVideoUrl = json['preview_video_url'];
    baseprice = json['baseprice'];
    entryLicense = json['entry_license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['file_content_hash'] = this.fileContentHash;
    data['title'] = this.title;
    data['description'] = this.description;
    data['preview'] = this.preview;
    data['bg_color'] = this.bgColor;
    data['speed'] = this.speed;
    data['downloads'] = this.downloads;
    data['views'] = this.views;
    data['aep_flag'] = this.aepFlag;
    data['bodymovin_version'] = this.bodymovinVersion;
    data['dotlottie_file'] = this.dotlottieFile;
    data['package_type'] = this.packageType;
    data['is_sticker'] = this.isSticker;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['in_process'] = this.inProcess;
    data['lottie_link'] = this.lottieLink;
    data['filetype'] = this.filetype;
    data['aep_file'] = this.aepFile;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['file'] = this.file;
    data['preview_url'] = this.previewUrl;
    data['preview_video_url'] = this.previewVideoUrl;
    data['baseprice'] = this.baseprice;
    data['entry_license'] = this.entryLicense;
    return data;
  }
}

class UserInfo {
  int id;
  String name;
  String url;
  String bio;
  String location;
  String city;
  String socialTwitter;
  String socialDribbble;
  String socialBehance;
  String link;
  String avatarlink;
  String profileLink;
  dynamic discourseAvatarUrl;

  UserInfo(
      {this.id,
        this.name,
        this.url,
        this.bio,
        this.location,
        this.city,
        this.socialTwitter,
        this.socialDribbble,
        this.socialBehance,
        this.link,
        this.avatarlink,
        this.profileLink,
        this.discourseAvatarUrl});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    bio = json['bio'];
    location = json['location'];
    city = json['city'];
    socialTwitter = json['social_twitter'];
    socialDribbble = json['social_dribbble'];
    socialBehance = json['social_behance'];
    link = json['link'];
    avatarlink = json['avatarlink'];
    profileLink = json['profile_link'];
    discourseAvatarUrl = json['discourse_avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['city'] = this.city;
    data['social_twitter'] = this.socialTwitter;
    data['social_dribbble'] = this.socialDribbble;
    data['social_behance'] = this.socialBehance;
    data['link'] = this.link;
    data['avatarlink'] = this.avatarlink;
    data['profile_link'] = this.profileLink;
    data['discourse_avatar_url'] = this.discourseAvatarUrl;
    return data;
  }
}

class AnimationResponseSerialize extends Serializable<List<AnimationData>>{
  @override
  List<AnimationData> deserialize(data) {
    return AnimationResponse.fromJson(data).data;
  }
}