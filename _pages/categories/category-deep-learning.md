---
title: "Deep Learning"
layout: archive
permalink: categories/deep-learning
author_profile: true
sidebar_main: true
---

<!-- 공백이 포함되어 있는 카테고리 이름의 경우 site.categories.['a b c'] 이런식으로! -->

***

{% assign posts = site.categories['Deep Learning'] | sort:"date" | reverse %}
{% for post in posts %}
  {% include archive-single.html %}
{% endfor %}

