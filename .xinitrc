#!/bin/sh

.config/xinitrc

setxkbmap de

setxkbmap -option caps:escape

exec i3
