

class HarmonyBean {
  Data? data;
  int? errorCode;
  String? errorMsg;

  HarmonyBean({this.data, this.errorCode, this.errorMsg});

  HarmonyBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }

  @override
  String toString() {
    return 'HarmonyBean{data: $data, errorCode: $errorCode, errorMsg: $errorMsg}';
  }
}

class Data {
  Links? links;
  Links? openSources;
  Links? tools;

  Data({this.links, this.openSources, this.tools});

  Data.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ?  Links.fromJson(json['links']) : null;
    openSources = json['open_sources'] != null
        ?  Links.fromJson(json['open_sources'])
        : null;
    tools = json['tools'] != null ?  Links.fromJson(json['tools']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (openSources != null) {
      data['open_sources'] = openSources!.toJson();
    }
    if (tools != null) {
      data['tools'] = tools!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{links: $links, openSources: $openSources, tools: $tools}';
  }
}

class Links {
  List<ArticleList>? articleList;
  String? author;
  List<Object>? children;
  int? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  int? order;
  int? parentChapterId;
  int? type;
  bool? userControlSetTop;
  int? visible;

  Links(
      {this.articleList,
        this.author,
        this.children,
        this.courseId,
        this.cover,
        this.desc,
        this.id,
        this.lisense,
        this.lisenseLink,
        this.name,
        this.order,
        this.parentChapterId,
        this.type,
        this.userControlSetTop,
        this.visible});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['articleList'] != null) {
      articleList = <ArticleList>[];
      json['articleList'].forEach((v) {
        articleList!.add( ArticleList.fromJson(v));
      });
    }
    author = json['author'];
    if (json['children'] != null) {
      children = <Object>[];
      json['children'].forEach((v) {
        children!.add(v);
      });
    }
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    type = json['type'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (articleList != null) {
      data['articleList'] = articleList!.map((v) => v.toJson()).toList();
    }
    data['author'] = author;
    if (children != null) {
      data['children'] = children!.map((v) => v).toList();
    }
    data['courseId'] = courseId;
    data['cover'] = cover;
    data['desc'] = desc;
    data['id'] = id;
    data['lisense'] = lisense;
    data['lisenseLink'] = lisenseLink;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['type'] = type;
    data['userControlSetTop'] = userControlSetTop;
    data['visible'] = visible;
    return data;
  }

  @override
  String toString() {
    return 'Links{articleList: $articleList, author: $author, children: $children, courseId: $courseId, cover: $cover, desc: $desc, id: $id, lisense: $lisense, lisenseLink: $lisenseLink, name: $name, order: $order, parentChapterId: $parentChapterId, type: $type, userControlSetTop: $userControlSetTop, visible: $visible}';
  }
}

class ArticleList {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<Object>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  @override
  String toString() {
    return 'ArticleList{adminAdd: $adminAdd, apkLink: $apkLink, audit: $audit, author: $author, canEdit: $canEdit, chapterId: $chapterId, chapterName: $chapterName, collect: $collect, courseId: $courseId, desc: $desc, descMd: $descMd, envelopePic: $envelopePic, fresh: $fresh, host: $host, id: $id, isAdminAdd: $isAdminAdd, link: $link, niceDate: $niceDate, niceShareDate: $niceShareDate, origin: $origin, prefix: $prefix, projectLink: $projectLink, publishTime: $publishTime, realSuperChapterId: $realSuperChapterId, selfVisible: $selfVisible, shareDate: $shareDate, shareUser: $shareUser, superChapterId: $superChapterId, superChapterName: $superChapterName, tags: $tags, title: $title, type: $type, userId: $userId, visible: $visible, zan: $zan}';
  }

  ArticleList(
      {this.adminAdd,
        this.apkLink,
        this.audit,
        this.author,
        this.canEdit,
        this.chapterId,
        this.chapterName,
        this.collect,
        this.courseId,
        this.desc,
        this.descMd,
        this.envelopePic,
        this.fresh,
        this.host,
        this.id,
        this.isAdminAdd,
        this.link,
        this.niceDate,
        this.niceShareDate,
        this.origin,
        this.prefix,
        this.projectLink,
        this.publishTime,
        this.realSuperChapterId,
        this.selfVisible,
        this.shareDate,
        this.shareUser,
        this.superChapterId,
        this.superChapterName,
        this.tags,
        this.title,
        this.type,
        this.userId,
        this.visible,
        this.zan});

  ArticleList.fromJson(Map<String, dynamic> json) {
    adminAdd = json['adminAdd'];
    apkLink = json['apkLink'];
    audit = json['audit'];
    author = json['author'];
    canEdit = json['canEdit'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    courseId = json['courseId'];
    desc = json['desc'];
    descMd = json['descMd'];
    envelopePic = json['envelopePic'];
    fresh = json['fresh'];
    host = json['host'];
    id = json['id'];
    isAdminAdd = json['isAdminAdd'];
    link = json['link'];
    niceDate = json['niceDate'];
    niceShareDate = json['niceShareDate'];
    origin = json['origin'];
    prefix = json['prefix'];
    projectLink = json['projectLink'];
    publishTime = json['publishTime'];
    realSuperChapterId = json['realSuperChapterId'];
    selfVisible = json['selfVisible'];
    shareDate = json['shareDate'];
    shareUser = json['shareUser'];
    superChapterId = json['superChapterId'];
    superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      tags = <Object>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    title = json['title'];
    type = json['type'];
    userId = json['userId'];
    visible = json['visible'];
    zan = json['zan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['adminAdd'] = adminAdd;
    data['apkLink'] = apkLink;
    data['audit'] = audit;
    data['author'] = author;
    data['canEdit'] = canEdit;
    data['chapterId'] = chapterId;
    data['chapterName'] = chapterName;
    data['collect'] = collect;
    data['courseId'] = courseId;
    data['desc'] = desc;
    data['descMd'] = descMd;
    data['envelopePic'] = envelopePic;
    data['fresh'] = fresh;
    data['host'] = host;
    data['id'] = id;
    data['isAdminAdd'] = isAdminAdd;
    data['link'] = link;
    data['niceDate'] = niceDate;
    data['niceShareDate'] = niceShareDate;
    data['origin'] = origin;
    data['prefix'] = prefix;
    data['projectLink'] = projectLink;
    data['publishTime'] = publishTime;
    data['realSuperChapterId'] = realSuperChapterId;
    data['selfVisible'] = selfVisible;
    data['shareDate'] = shareDate;
    data['shareUser'] = shareUser;
    data['superChapterId'] = superChapterId;
    data['superChapterName'] = superChapterName;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v).toList();
    }
    data['title'] = title;
    data['type'] = type;
    data['userId'] = userId;
    data['visible'] = visible;
    data['zan'] = zan;
    return data;
  }
}