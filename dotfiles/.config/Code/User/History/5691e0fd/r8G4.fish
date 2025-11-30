function fish_right_prompt
    # Right prompt: current time in bright blue
    set_color brblue
    printf '%s' (date +"%H:%M")
    set_color normal
end
