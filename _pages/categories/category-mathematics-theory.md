---
title: "Mathematics Theory"
layout: archive
permalink: categories/mathematics-theory
author_profile: true
sidebar_main: true
---

<!-- 공백이 포함되어 있는 카테고리 이름의 경우 site.categories.['a b c'] 이런식으로! -->

***

{% assign posts = site.categories['Mathematics Theory'] | sort:"date" | reverse %}
{% for post in posts %}
  {% include archive-single.html %}
{% endfor %}

