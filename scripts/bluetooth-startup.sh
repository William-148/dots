#!/bin/bash

# CONNECT BLUETOOTH DEVICES AUTOMATICALLY AT STARTUP

# CONNECT HEADSET ***********************************
Headset_MAC="00:18:09:21:6F:97"
bluetoothctl disconnect $Headset_MAC
sleep 1
bluetoothctl connect $Headset_MAC
