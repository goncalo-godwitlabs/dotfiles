# function my_preexec --on-event fish_preexec
# whatever needs to be run before the command
# end

function my_postexec --on-event fish_postexec
    set arg0 (echo $argv | cut -d ' ' -f 1)
    # send notification when command starts with `time`
    if [ "$arg0" = "time" ]; notify-send -t 500 -u critical Done! "$argv"; end
    if [ -n "$argv" ]; paplay /usr/share/sounds/ubuntu/stereo/button-toggle-off.ogg; end
end

source /etc/grc.fish
set -gx EDITOR vim
set -gx PAGER most
set -gx BAT_PAGER "less -XRF"

kitty + complete setup fish | source

set -gx PATH /usr/local/cuda-10.1/bin $PATH
set -gx PATH /usr/local/cuda-10.1/NsightCompute-2019.3 $PATH
set -gx LD_LIBRARY_PATH /usr/local/cuda-10.1/lib64 $LD_LIBRARY_PATH

