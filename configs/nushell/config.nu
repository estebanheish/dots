$env.config.show_banner = false
$env.config.rm.always_trash = true
$env.config.filesize.metric = true
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"
$env.config.edit_mode = "vi"
$env.config.highlight_resolved_externals = true
$env.config.buffer_editor = "hx"

$env.config.keybindings ++= [
    {
        name: edit
        modifier: control
        keycode: char_e
        mode: [emacs, vi_normal, vi_insert]
        event: { send: OpenEditor }
    }
    { 
        name: broot
        modifier: control
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: { send: executeHostCommand cmd: br }
    }
    { 
        name: yazi
        modifier: control
        keycode: char_y
        mode: [emacs, vi_normal, vi_insert]
        event: { send: executeHostCommand cmd: yy }
    }
    {
        name: cut_line_from_start
        modifier: control
        keycode: char_u
        mode: vi_insert
        event: {edit: cutfromstart}
    }
]

$env.PROMPT_COMMAND_RIGHT = {||
   let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }
    ([$last_exit_code, (char space), (ansi purple), $env.USER, "@", (sys host | get hostname)] | str join)
}

# direnv
$env.config.hooks.pre_prompt = [{ ||
    if (which direnv | is-empty) {
        return
    }
    direnv export json | from json | default {} | load-env
}]

$env.EDITOR = "hx"
$env.TERMINAL = "ghostty"
$env.FILE = "yazi"
$env.BROWSER = "firefox-esr"
# $env.READER = "zathura"
# $env.OPENER = "xdg-open"

source ~/.config/nushell/aliases.nu
source ~/.config/nushell/broot.nu
source ~/.config/nushell/lf.nu
source ~/.config/nushell/yazi.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/completions.nu
source ~/.config/nushell/themes/solarized_dark.nu
# source ~/.config/nushell/plugins.nu

