---
title: "Codex"
layout: archive
permalink: categories/codex
author_profile: true
sidebar_main: true
---

<!-- 공백이 포함되어 있는 카테고리 이름의 경우 site.categories.['a b c'] 이런식으로! -->

***

{% assign posts = site.categories.Codex %}
{% if posts %}
  {% assign posts = posts | sort:"date" | reverse %}
  {% for post in posts %}
    {% include archive-single.html %}
  {% endfor %}
{% endif %}
