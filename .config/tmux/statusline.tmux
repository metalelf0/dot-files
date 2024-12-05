#!/usr/bin/env bash

# TokyoNight colors for Tmux

set -g mode-style "fg=$color_fg,bg=$color_bg"

set -g message-style "fg=$color_fg,bg=$color_bg"
set -g message-command-style "fg=$color_fg,bg=$color_bg"

set -g pane-border-style "fg=$color_bg"
set -g pane-active-border-style "fg=$color_fg"

set -g status "on"
set -g status-justify "left"

set -g status-bg "$color_darker_bg"

set -g status-style "fg=$color_fg,bg=$color_darker_bg"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=$color_dark_fg,bg=$color_fg,bold] #S #[fg=$color_fg,bg=$color_darker_bg,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=$color_darker_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_darker_bg] #{prefix_highlight} #[fg=$color_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg] %Y-%m-%d  %I:%M %p #[fg=$color_fg,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_dark_fg,bg=$color_fg,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=$color_darker_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_darker_bg] #{prefix_highlight} #[fg=$color_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg] %Y-%m-%d  %H:%M #[fg=$color_fg,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_dark_fg,bg=$color_fg,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=$color_alt_accent,bg=$color_darker_bg"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=$color_alt_accent,bg=$color_darker_bg"
setw -g window-status-format "#[fg=$color_darker_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=$color_darker_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=$color_darker_bg,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg,bold] #I  #W #F #[fg=$color_bg,bg=$color_darker_bg,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=$color_accent]#[bg=$color_darker_bg]#[fg=$color_darker_bg]#[bg=$color_accent]"
set -g @prefix_highlight_output_suffix ""
