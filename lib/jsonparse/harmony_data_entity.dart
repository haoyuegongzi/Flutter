import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

@JsonSerializable()
class HarmonyDataEntity {
	late HarmonyDataData data;
	late int errorCode = 0;
	late String errorMsg = '';

	HarmonyDataEntity();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataData {
	late HarmonyDataDataLinks links;
	late HarmonyDataDataOpenSources open_sources;
	late HarmonyDataDataTools tools;

	HarmonyDataData();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataLinks {
	late List<HarmonyDataDataLinksArticleList> articleList = [];
	late String author = '';
	late List<dynamic> children = [];
	late int courseId = 0;
	late String cover = '';
	late String desc = '';
	late int id = 0;
	late String lisense = '';
	late String lisenseLink = '';
	late String name = '';
	late int order = 0;
	late int parentChapterId = 0;
	late int type = 0;
	late bool userControlSetTop = false;
	late int visible = 0;

	HarmonyDataDataLinks();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataLinksArticleList {
	late bool adminAdd = false;
	late String apkLink = '';
	late int audit = 0;
	late String author = '';
	late bool canEdit = false;
	late int chapterId = 0;
	late String chapterName = '';
	late bool collect = false;
	late int courseId = 0;
	late String desc = '';
	late String descMd = '';
	late String envelopePic = '';
	late bool fresh = false;
	late String host = '';
	late int id = 0;
	late bool isAdminAdd = false;
	late String link = '';
	late String niceDate = '';
	late String niceShareDate = '';
	late String origin = '';
	late String prefix = '';
	late String projectLink = '';
	late int publishTime = 0;
	late int realSuperChapterId = 0;
	late int selfVisible = 0;
	late int shareDate = 0;
	late String shareUser = '';
	late int superChapterId = 0;
	late String superChapterName = '';
	late List<dynamic> tags = [];
	late String title = '';
	late int type = 0;
	late int userId = 0;
	late int visible = 0;
	late int zan = 0;

	HarmonyDataDataLinksArticleList();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataOpenSources {
	late List<HarmonyDataDataOpenSourcesArticleList> articleList = [];
	late String author = '';
	late List<dynamic> children = [];
	late int courseId = 0;
	late String cover = '';
	late String desc = '';
	late int id = 0;
	late String lisense = '';
	late String lisenseLink = '';
	late String name = '';
	late int order = 0;
	late int parentChapterId = 0;
	late int type = 0;
	late bool userControlSetTop = false;
	late int visible = 0;

	HarmonyDataDataOpenSources();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataOpenSourcesArticleList {
	late bool adminAdd = false;
	late String apkLink = '';
	late int audit = 0;
	late String author = '';
	late bool canEdit = false;
	late int chapterId = 0;
	late String chapterName = '';
	late bool collect = false;
	late int courseId = 0;
	late String desc = '';
	late String descMd = '';
	late String envelopePic = '';
	late bool fresh = false;
	late String host = '';
	late int id = 0;
	late bool isAdminAdd = false;
	late String link = '';
	late String niceDate = '';
	late String niceShareDate = '';
	late String origin = '';
	late String prefix = '';
	late String projectLink = '';
	late int publishTime = 0;
	late int realSuperChapterId = 0;
	late int selfVisible = 0;
	late int shareDate = 0;
	late String shareUser = '';
	late int superChapterId = 0;
	late String superChapterName = '';
	late List<dynamic> tags = [];
	late String title = '';
	late int type = 0;
	late int userId = 0;
	late int visible = 0;
	late int zan = 0;

	HarmonyDataDataOpenSourcesArticleList();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataTools {
	late List<HarmonyDataDataToolsArticleList> articleList = [];
	late String author = '';
	late List<dynamic> children = [];
	late int courseId = 0;
	late String cover = '';
	late String desc = '';
	late int id = 0;
	late String lisense = '';
	late String lisenseLink = '';
	late String name = '';
	late int order = 0;
	late int parentChapterId = 0;
	late int type = 0;
	late bool userControlSetTop = false;
	late int visible = 0;

	HarmonyDataDataTools();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HarmonyDataDataToolsArticleList {
	late bool adminAdd = false;
	late String apkLink = '';
	late int audit = 0;
	late String author = '';
	late bool canEdit = false;
	late int chapterId = 0;
	late String chapterName = '';
	late bool collect = false;
	late int courseId = 0;
	late String desc = '';
	late String descMd = '';
	late String envelopePic = '';
	late bool fresh = false;
	late String host = '';
	late int id = 0;
	late bool isAdminAdd = false;
	late String link = '';
	late String niceDate = '';
	late String niceShareDate = '';
	late String origin = '';
	late String prefix = '';
	late String projectLink = '';
	late int publishTime = 0;
	late int realSuperChapterId = 0;
	late int selfVisible = 0;
	late int shareDate = 0;
	late String shareUser = '';
	late int superChapterId = 0;
	late String superChapterName = '';
	late List<dynamic> tags = [];
	late String title = '';
	late int type = 0;
	late int userId = 0;
	late int visible = 0;
	late int zan = 0;

	HarmonyDataDataToolsArticleList();

	@override
	String toString() {
		return jsonEncode(this);
	}
}