---
title: "Python Coding Test"
layout: archive
permalink: categories/python-coding-test
author_profile: true
sidebar_main: true
---

<!-- This page is generated from the `Python Coding Test` category key. Keep the key aligned with post front matter and `_data/learning_paths.yml`. -->

{% assign posts = site.categories['Python Coding Test'] %}
{% if posts and posts.size > 0 %}
  {% assign posts = posts | sort: "date" | reverse %}
  {% for post in posts %}
    {% include archive-single.html %}
  {% endfor %}
{% else %}
  <p class="notice--info">아직 이 카테고리에 공개된 글이 없습니다. 학습 경로가 채워지면 이곳에 글 목록이 표시됩니다.</p>
{% endif %}
