{
  pkgs,
  theme,
  ...
}:
with theme.menu; {
  home.packages = [pkgs.kickoff];
  xdg.configFile."kickoff/config.toml".text = ''
    prompt = '''

    # space between window border and the content in pixel
    padding = 100

    fonts = [ 'Monaspace Xenon' ]
    font_size = 32.0

    [history]
    decrease_interval = 48 # interval to decrease the number of launches in hours

    [colors]
    # color format: rgb or rgba, if transparency is desired
    background = '#${bg}aa'
    prompt = '#${text}ff'
    text = '#${text}ff'          # for search results
    text_query = '#${query}ff'    # for the search query
    text_selected = '#${selected}ff' # for the currently selected result

    [keybindings]
    # keybindings syntax: ctrl/shift/alt/logo as modifiers and a key joined by '+' signs
    # A list of available keys can be found here: https://docs.rs/crate/x11-keysymdef/0.2.0/source/src/keysym.json
    paste = ["ctrl+v"]
    execute = ["KP_Enter", "Return"]
    delete = ["KP_Delete", "Delete", "BackSpace"]
    delete_word = ["ctrl+KP_Delete", "ctrl+Delete", "ctrl+BackSpace", "ctrl+w"]
    complete = ["Tab"]
    nav_up = ["Up", "ctrl+e"]
    nav_down = ["Down", "ctrl+n"]
    exit = ["Escape"]
  '';
}
