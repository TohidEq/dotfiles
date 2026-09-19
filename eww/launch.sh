#!/bin/bash

## open widgets
run_eww() {
  eww --config $HOME/.config/eww open-many \
    launcher_controlls\
    launcher_apps_left\
    launcher_apps_left_bottom\
    launcher_apps_right

    # time_stack_window_m \
    # time_stack_window_h \
    # time_stack_window_ff \
    # time_stack_window_f\
}

# launch or close widgets accordingly
if pgrep -x "eww" >/dev/null; then
  pkill -x eww
else
  eww daemon &
  run_eww &
fi
