import 'package:autility/autility.dart';

class AnimationResponseV2 {
  int currentPage;
  List<AnimationDataV2> data;
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

  AnimationResponseV2(
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

  AnimationResponseV2.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<AnimationDataV2>();
      json['data'].forEach((v) {
        data.add(new AnimationDataV2.fromJson(v));
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

class AnimationDataV2 {
  int id;
  int userId;
  String slug;
  String fileHash;
  String fileContentHash;
  String title;
  String description;
  String preview;
  String previewVideo;
  int previewFrame;
  int videoFramerate;
  String bgColor;
  int speed;
  int downloads;
  int views;
  int aepFlag;
  dynamic bodymovinVersion;
  String dataFile;
  dynamic dotlottieFile;
  String package;
  dynamic packageType;
  int price;
  int type;
  int isSticker;
  int status;
  String publishedAt;
  String createdAt;
  String updatedAt;
  int inProcess;
  String file;
  String previewUrl;
  String previewVideoUrl;
  String baseprice;
  EntryLicense entryLicense;

  AnimationDataV2(
      {this.id,
        this.userId,
        this.slug,
        this.fileHash,
        this.fileContentHash,
        this.title,
        this.description,
        this.preview,
        this.previewVideo,
        this.previewFrame,
        this.videoFramerate,
        this.bgColor,
        this.speed,
        this.downloads,
        this.views,
        this.aepFlag,
        this.bodymovinVersion,
        this.dataFile,
        this.dotlottieFile,
        this.package,
        this.packageType,
        this.price,
        this.type,
        this.isSticker,
        this.status,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.inProcess,
        this.file,
        this.previewUrl,
        this.previewVideoUrl,
        this.baseprice,
        this.entryLicense});

  AnimationDataV2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    slug = json['slug'];
    fileHash = json['file_hash'];
    fileContentHash = json['file_content_hash'];
    title = json['title'];
    description = json['description'];
    preview = json['preview'];
    previewVideo = json['preview_video'];
    previewFrame = json['preview_frame'];
    videoFramerate = json['video_framerate'];
    bgColor = json['bg_color'];
    speed = json['speed'];
    downloads = json['downloads'];
    views = json['views'];
    aepFlag = json['aep_flag'];
    bodymovinVersion = json['bodymovin_version'];
    dataFile = json['data_file'];
    dotlottieFile = json['dotlottie_file'];
    package = json['package'];
    packageType = json['package_type'];
    price = json['price'];
    type = json['type'];
    isSticker = json['is_sticker'];
    status = json['status'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inProcess = json['in_process'];
    file = json['file'];
    previewUrl = json['preview_url'];
    previewVideoUrl = json['preview_video_url'];
    baseprice = json['baseprice'];
    entryLicense = json['entry_license'] != null
        ? new EntryLicense.fromJson(json['entry_license'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['slug'] = this.slug;
    data['file_hash'] = this.fileHash;
    data['file_content_hash'] = this.fileContentHash;
    data['title'] = this.title;
    data['description'] = this.description;
    data['preview'] = this.preview;
    data['preview_video'] = this.previewVideo;
    data['preview_frame'] = this.previewFrame;
    data['video_framerate'] = this.videoFramerate;
    data['bg_color'] = this.bgColor;
    data['speed'] = this.speed;
    data['downloads'] = this.downloads;
    data['views'] = this.views;
    data['aep_flag'] = this.aepFlag;
    data['bodymovin_version'] = this.bodymovinVersion;
    data['data_file'] = this.dataFile;
    data['dotlottie_file'] = this.dotlottieFile;
    data['package'] = this.package;
    data['package_type'] = this.packageType;
    data['price'] = this.price;
    data['type'] = this.type;
    data['is_sticker'] = this.isSticker;
    data['status'] = this.status;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['in_process'] = this.inProcess;
    data['file'] = this.file;
    data['preview_url'] = this.previewUrl;
    data['preview_video_url'] = this.previewVideoUrl;
    data['baseprice'] = this.baseprice;
    if (this.entryLicense != null) {
      data['entry_license'] = this.entryLicense.toJson();
    }
    return data;
  }
}

class EntryLicense {
  int id;
  int userSegmentId;
  int entryId;
  int entryLicenseTypeId;
  String createdAt;
  String updatedAt;
  EntryLicenseType entryLicenseType;

  EntryLicense(
      {this.id,
        this.userSegmentId,
        this.entryId,
        this.entryLicenseTypeId,
        this.createdAt,
        this.updatedAt,
        this.entryLicenseType});

  EntryLicense.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userSegmentId = json['user_segment_id'];
    entryId = json['entry_id'];
    entryLicenseTypeId = json['entry_license_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    entryLicenseType = json['entry_license_type'] != null
        ? new EntryLicenseType.fromJson(json['entry_license_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_segment_id'] = this.userSegmentId;
    data['entry_id'] = this.entryId;
    data['entry_license_type_id'] = this.entryLicenseTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.entryLicenseType != null) {
      data['entry_license_type'] = this.entryLicenseType.toJson();
    }
    return data;
  }
}

class EntryLicenseType {
  int id;
  String ccUserOptionsAdaptations;
  String ccUserOptionsCommercial;
  String ccType;
  String ccTypeDescription;
  String imagePath;
  String createdAt;
  String updatedAt;
  String imageUrl;

  EntryLicenseType(
      {this.id,
        this.ccUserOptionsAdaptations,
        this.ccUserOptionsCommercial,
        this.ccType,
        this.ccTypeDescription,
        this.imagePath,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  EntryLicenseType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ccUserOptionsAdaptations = json['cc_user_options_adaptations'];
    ccUserOptionsCommercial = json['cc_user_options_commercial'];
    ccType = json['cc_type'];
    ccTypeDescription = json['cc_type_description'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cc_user_options_adaptations'] = this.ccUserOptionsAdaptations;
    data['cc_user_options_commercial'] = this.ccUserOptionsCommercial;
    data['cc_type'] = this.ccType;
    data['cc_type_description'] = this.ccTypeDescription;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class AnimationResponseV2Serialize extends Serializable<List<AnimationDataV2>>{
  @override
  List<AnimationDataV2> deserialize(data) {
    return AnimationResponseV2.fromJson(data).data;
  }
}
