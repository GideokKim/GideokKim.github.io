---
title: "Git 사용법 정리"
layout: archive
permalink: categories/git
author_profile: true
sidebar_main: true
---

<!-- 공백이 포함되어 있는 카테고리 이름의 경우 site.categories['a b c'] 이런식으로! -->

***

{% assign posts = site.categories.Git %}
{% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}