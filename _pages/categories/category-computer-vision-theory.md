---
title: "Computer Vision Theory"
layout: archive
permalink: categories/computer-vision-theory
author_profile: true
sidebar_main: true
---

***

{% assign posts = site.categories['Computer Vision Theory'] | sort:"date" | reverse %}
{% for post in posts %}
  {% include archive-single.html %}
{% endfor %}
