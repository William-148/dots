#!/bin/bash

sleep 1

# kill all posible running xdg-desktop-portals
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal

# start xdg-desktop-portal-hyprland
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2

# start xdg-desktop-portal
/usr/lib/xdg-desktop-portal &
sleep 1
