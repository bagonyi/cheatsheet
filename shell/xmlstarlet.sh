#!/usr/bin/env bash

# Select "href" attribute's value of an <a> where text matches "Click here"
xml sel -t -v '//a[contains(text(), "Click here")]/@href' input.xml
