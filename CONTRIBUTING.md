# Contributing

* Add your theme to the repo. 

* Update the read me with your theme.

* Add your theme to add_themes.sh

Keep themes uniform:
* Start with `source "${0:h}/lib.zsh"` so themes work with plain zsh and oh-my-zsh.
* No `RPROMPT` (right-side prompt).
* One success/error emoji, one clean/dirty git emoji, using the same colors and layout as the existing themes.

ex:

*ThemeName:*

```console
$ cp theme-name.zsh-theme ~/.oh-my-zsh/themes/
```

> Add `ZSH_THEME="theme-name"` to your zshrc.

To add a holiday, wire it into `get_theme_season.sh` so the theme auto-applies on its date.

Don't like a theme? Make a PR :)
