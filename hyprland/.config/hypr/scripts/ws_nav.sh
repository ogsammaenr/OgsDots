#!/bin/bash

YON=$1
MIN=$2
MAX=$3

# Aktif çalışma alanının sadece numarasını çekiyoruz
MEVCUT=$(hyprctl activeworkspace | head -1 | awk '{print $3}')

if [ "$YON" == "prev" ]; then
    # Eğer 1'den büyükse bir öncekine git
    if [ "$MEVCUT" -gt $MIN ]; then
        HEDEF=$((MEVCUT - 1))
        hyprctl dispatch "hl.dsp.focus({ workspace = \"$HEDEF\" })"
    fi
elif [ "$YON" == "next" ]; then
    # Eğer 7'den küçükse bir sonrakine git
    if [ "$MEVCUT" -lt $MAX ]; then
        HEDEF=$((MEVCUT + 1))
        hyprctl dispatch "hl.dsp.focus({ workspace = \"$HEDEF\" })"
    fi
fi
