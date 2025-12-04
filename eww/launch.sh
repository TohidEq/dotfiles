#!/bin/bash

## open widgets
run_eww() {
	eww --config $HOME/.config/eww open-many \
				time_stack_window_f \
				time_stack_window_m \
				time_stack_window_h \
				testa
				#time_stack_window_s \
				#clock \

}

# launch or close widgets accordingly
if pgrep -x "eww" >/dev/null; then
	pkill -x eww
else
	eww daemon & run_eww &
fi
