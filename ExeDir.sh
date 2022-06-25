#!/bin/bash
for arc in ~/.config/awesome/autostart/*; do
	[ -f "$arc" ] && [ -x "$arc" ] && /bin/bash "$arc"
done

