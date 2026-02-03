# Base24 Horizon palette
set -l base00 "1c1e26" # background
set -l base01 "232530" # lighter background 
set -l base02 "2e303e" # selection background
set -l base03 "6c6f93" # comments, invisibles
set -l base04 "9da0a2" # dark foreground
set -l base05 "cbced0" # default foreground
set -l base06 "dcdfe4" # light foreground
set -l base07 "e3e6ee" # lightest foreground
set -l base08 "e95678" # red/error
set -l base09 "f09383" # orange
set -l base0A "fac29a" # yellow
set -l base0B "29d398" # green
set -l base0C "59e1e3" # cyan
set -l base0D "26bbd9" # blue
set -l base0E "ee64ac" # magenta/purple
set -l base0F "b877db" # brown/violet

# Extended Base24 colors (Horizon specific accents)
set -l base10 "f43e5c" # bright red
set -l base11 "f09383" # bright orange  
set -l base12 "09f7a0" # bright green
set -l base13 "25b2bc" # bright cyan
set -l base14 "3fc56b" # bright blue variant
set -l base15 "f075b7" # bright magenta
set -l base16 "6c6f93" # muted variant
set -l base17 "1a1c23" # darker background
 
# Fish color variables
set -U fish_color_normal $base05
set -U fish_color_command $base0D
set -U fish_color_keyword $base0E
set -U fish_color_quote $base0A
set -U fish_color_redirection $base0C
set -U fish_color_end $base0E
set -U fish_color_error $base08
set -U fish_color_param $base05
set -U fish_color_comment $base03
set -U fish_color_selection --background=$base02
set -U fish_color_search_match --background=$base02
set -U fish_color_operator $base0C
set -U fish_color_escape $base0F
set -U fish_color_autosuggestion $base03
set -U fish_color_cancel $base08
set -U fish_color_cwd $base0B
set -U fish_color_cwd_root $base08
set -U fish_color_host $base0D
set -U fish_color_host_remote $base0A
set -U fish_color_status $base08
set -U fish_color_user $base0B
set -U fish_color_valid_path --underline

# Completion pager colors
set -U fish_pager_color_background
set -U fish_pager_color_completion $base05
set -U fish_pager_color_description $base03
set -U fish_pager_color_prefix $base0D
set -U fish_pager_color_progress $base17 --background=$base0D
set -U fish_pager_color_secondary_background
set -U fish_pager_color_secondary_completion
set -U fish_pager_color_secondary_description $base04
set -U fish_pager_color_secondary_prefix
set -U fish_pager_color_selected_background --background=$base02
set -U fish_pager_color_selected_completion $base06
set -U fish_pager_color_selected_description $base04
set -U fish_pager_color_selected_prefix $base0E

# Git colors (se usar tide ou outros prompts que respeitam)
set -U fish_git_prompt_color $base0D
set -U fish_git_prompt_color_branch $base0D
set -U fish_git_prompt_color_dirty $base08
set -U fish_git_prompt_color_staged $base0A
set -U fish_git_prompt_color_stash $base0C
set -U fish_git_prompt_color_untrackedfiles $base09
set -U fish_git_prompt_color_upstream $base0B

# Syntax highlighting colors
set -U fish_color_match $base0C
set -U fish_color_history_current --background=$base02

# Export palette for other tools
set -Ux BASE24_00 $base00
set -Ux BASE24_01 $base01
set -Ux BASE24_02 $base02
set -Ux BASE24_03 $base03
set -Ux BASE24_04 $base04
set -Ux BASE24_05 $base05
set -Ux BASE24_06 $base06
set -Ux BASE24_07 $base07
set -Ux BASE24_08 $base08
set -Ux BASE24_09 $base09
set -Ux BASE24_0A $base0A
set -Ux BASE24_0B $base0B
set -Ux BASE24_0C $base0C
set -Ux BASE24_0D $base0D
set -Ux BASE24_0E $base0E
set -Ux BASE24_0F $base0F
