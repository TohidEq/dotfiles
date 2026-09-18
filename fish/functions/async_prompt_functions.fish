function _git_branch_name
    #uncommentable for test async# sleep 1 # For demo.
    git symbolic-ref --short HEAD ^/dev/null
end

function fish_right_prompt
    echo (set_color 88f)(_git_branch_name) (set_color cyan)(prompt_pwd)
end

# Async prompt setup.
set async_prompt_functions _git_branch_name

function _git_branch_name_loading_indicator
    echo (set_color brblack)…(set_color normal)
end