#!/bin/bash

pactl load-module module-null-sink sink_name=virtual_microphone sink_properties=device.description=Virtual-Microphone media.class=Audio/Duplex
