// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.ad,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<dynamic> data;
    Ad ad;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        total: json["total"] == null ? null : json["total"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
        ad: json["ad"] == null ? null : Ad.fromJson(json["ad"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "per_page": perPage == null ? null : perPage,
        "total": total == null ? null : total,
        "total_pages": totalPages == null ? null : totalPages,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "ad": ad == null ? null : ad.toJson(),
    };
}

class Ad {
    Ad({
        this.company,
        this.url,
        this.text,
    });

    String company;
    String url;
    String text;

    factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        company: json["company"] == null ? null : json["company"],
        url: json["url"] == null ? null : json["url"],
        text: json["text"] == null ? null : json["text"],
    );

    Map<String, dynamic> toJson() => {
        "company": company == null ? null : company,
        "url": url == null ? null : url,
        "text": text == null ? null : text,
    };
}
