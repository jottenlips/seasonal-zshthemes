# Shared support for seasonal-zshthemes.
# Works with plain zsh and with oh-my-zsh.

# Provide oh-my-zsh style color arrays ($fg, $fg_bold, ...) for plain zsh.
# oh-my-zsh already defines these, so this only runs when they are missing.
if (( ! ${+fg} )); then
  autoload -U colors && colors
fi

# Provide git_prompt_info for plain zsh.
# oh-my-zsh already provides git_prompt_info, so this only runs when missing.
if (( ! ${+functions[git_prompt_info]} )); then
  function git_prompt_info() {
    if [[ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
      return 0
    fi

    local ref
    ref="$(git symbolic-ref HEAD 2>/dev/null)" || ref="$(git rev-parse --short HEAD 2>/dev/null)" || return 0
    ref="${ref#refs/heads/}"
    ref="${ref:gs/%/%%}"

    local prompt="${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}"
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
      prompt+="${ZSH_THEME_GIT_PROMPT_DIRTY}"
    else
      prompt+="${ZSH_THEME_GIT_PROMPT_CLEAN}"
    fi
    prompt+="${ZSH_THEME_GIT_PROMPT_SUFFIX}"

    print -rn -- "$prompt"
  }
fi
