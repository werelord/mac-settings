set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 0
set -g __fish_git_prompt_color_branch --bold cyan
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_upstream --bold green
set -g __fish_git_prompt_color_dirtystate --bold magenta
set -g __fish_git_prompt_color_stagedstate --bold yellow
set -g __fish_git_prompt_color_invalidstate --bold red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate --bold green

function fish_prompt --description 'Write out the prompt'

    set stat $status

	# Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname)
    end

	if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

	if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

	if not set -q __fish_color_cyan
		set -g __fish_color_cyan (set_color -o cyan)
	end

	#Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

	set -l __fish_jb (__fish_git_prompt)
	#if test $__fish_jb = ""
	#	set -l __fish_jb ""
	#end

	switch $USER
	case root
		if not set -q __fish_prompt_cwd
        	if set -q fish_color_cwd_root
            	set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        	else
            	set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        	end
    	end

		printf '%s@%s %s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

	case '*'
		if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

		printf '\f\r%s[%s] %s%s@%s%s' "$__fish_color_cyan" (date "+%Y.%m.%d_%H:%M:%S") "$__fish_color_blue" $USER "$__fish_prompt_hostname"
		printf '%s%s%s (%s)%s\f\r' (set_color normal) "$__fish_jb" "$__fish_color_status" "$stat"
		printf '%s%s\f\r%s> ' "$__fish_prompt_cwd" (pwd) "$__fish_prompt_normal"

	end
end
