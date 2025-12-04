#!/bin/bash

## open widgets
run_eww() {
  eww --config $HOME/.config/eww open-many \
    time_stack_window_m \
    time_stack_window_h \
    time_stack_window_ff \
    time_stack_window_f \
    testa
  #time_stack_window_s \
  #time_stack_window_fff \
  #clock \

}

# launch or close widgets accordingly
if pgrep -x "eww" >/dev/null; then
  pkill -x eww
else
  eww daemon &
  run_eww &
fi
