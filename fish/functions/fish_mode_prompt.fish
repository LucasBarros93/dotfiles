function fish_right_prompt
    switch $fish_bind_mode
        case default
            set_color $BASE24_0E 
            echo '   '
        case insert
            set_color --bold  $BASE24_0B 
            echo '   '
        case replace_one
            set_color --bold  $BASE24_0A 
            echo '   '
        case replace
            set_color --bold  $BASE24_0A 
            echo '   '
        case visual
            set_color --bold  $BASE24_0D 
            echo '   '
    end
    set_color normal
end
