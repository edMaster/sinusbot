#!/bin/bash

echo "Starting TeamSpeak 3 SinusBot ..."
xinit $SINUS_DIR/ts3bot -- /usr/bin/Xvfb :1 -screen 0 800x600x16 -ac "$SINUS_USER"
