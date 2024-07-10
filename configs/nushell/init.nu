use ~/.config/nushell/themes/papercolor-dark.nu

$env.config = ($env.config | merge {
    show_banner: false
    rm: { 
        always_trash: true 
    }
    filesize: {
        metric: true
    }
    cursor_shape: {
        vi_insert: line
        vi_normal: block
    }
    edit_mode: vi
    highlight_resolved_externals: true

    color_config: (papercolor-dark)
})

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

$env.config.hooks.pre_prompt ++= { ||
    if (which direnv | is-empty) {
        return
    }
    direnv export json | from json | default {} | load-env
}

source ~/.config/nushell/aliases.nu
source ~/.config/nushell/broot.nu
source ~/.config/nushell/lf.nu
source ~/.config/nushell/yazi.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/completions.nu
source ~/.config/nushell/plugins.nu
