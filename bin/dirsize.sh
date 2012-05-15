#!/bin/bash

shopt -s nullglob

for i in *; do du -s "$i"; done
for i in .[!.]*; do du -s "$i"; done
for i in .??*; do du -s "$i"; done
