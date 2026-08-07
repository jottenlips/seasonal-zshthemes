# Install

seasonal zsh prompts with git status

These themes work with plain zsh or with oh-my-zsh. The only dependency is git
(for the branch name and clean/dirty emoji).

## With oh-my-zsh

>- Clone me

>- Run

```console
cd seasonal-zshthemes
sh add_themes.sh
``` 

This copies `lib.zsh` and all the theme files to `~/.oh-my-zsh/themes/`.

## With plain zsh

No copying needed, just source a theme from your `~/.zshrc`:

```console
source ~/seasonal-zshthemes/summer.zsh-theme
```

## Automatically set the theme for the season you are experiencing. 

The script picks the matching holiday theme on the holiday, otherwise the theme for the current season.

### With oh-my-zsh

Set your zsh theme to the get theme for season shell script.

```console
$ vim ~/.zshrc
```

```
ZSH_THEME=$(sh ~/seasonal-zshthemes/get_theme_season.sh)
```

### With plain zsh

```console
$ vim ~/.zshrc
```

```
source ~/seasonal-zshthemes/$(sh ~/seasonal-zshthemes/get_theme_season.sh).zsh-theme
```

## Themes

All themes share the same layout: a status emoji (green on success, red on error), the
current directory, and git status with a clean/dirty emoji. There is no right-side prompt,
so copying from the terminal stays clean.

## Seasons

| Theme  | Success | Error | Clean | Dirty |
| ------ | ------- | ----- | ----- | ----- |
| winter | ❄️ | 🥶 | ⛄ | 🌨️ |
| spring | 🌸 | 🌧️ | 🐰 | 🌱 |
| summer | ☀️ | 🦑 | ✨ | 🐬 |
| fall   | 🍁 | 🎃 | 🦉 | 🍂 |

## Holidays

| Theme       | Date                | Success | Error | Clean | Dirty |
| ----------- | ------------------- | ------- | ----- | ----- | ----- |
| newyear     | Jan 1 & Dec 31      | 🎆 | 🎇 | 🎉 | 🥂 |
| mlk         | 3rd Mon of Jan      | ✊ | 🕯️ | 🕊️ | 🖤 |
| valentine   | Feb 14              | 💘 | 💔 | 🌹 | 💌 |
| presidents  | 3rd Mon of Feb      | 🎩 | 🦅 | ⚖️ | 🏛️ |
| stpatrick   | Mar 17              | ☘️ | 🍀 | 🇮🇪 | 🍺 |
| easter      | Easter Sunday       | 🐣 | 🥚 | 🐰 | 🧺 |
| memorial    | Last Mon of May     | 🕊️ | 🎖️ | 🕊️ | 🦅 |
| juneteenth  | Jun 19              | ✊🏾 | 🔥 | 🕊️ | 🖤 |
| independence| Jul 4               | 🦅 | 🎆 | 🎇 | 🧨 |
| labor       | 1st Mon of Sep      | 🛠️ | ⚙️ | 🏗️ | 🔧 |
| columbus    | 2nd Mon of Oct      | 🧭 | ⛵ | 🌎 | 🗺️ |
| halloween   | Oct 31              | 💀 | 👻 | 🌕 | 🕸️ |
| veterans    | Nov 11              | 🎖️ | 🫡 | 🦅 | 🎗️ |
| thanksgiving| 4th Thu of Nov      | 🦃 | 🍗 | 🍁 | 🥧 |
| holiday     | Dec 24 & 25         | 🎅 | 🎁 | 🎄 | 🛷 |

To set any theme manually, e.g.:

```console
$ cp summer.zsh-theme ~/.oh-my-zsh/themes/
```

> Add `ZSH_THEME="summer"` to your zshrc.

## Screenshots

| Theme | Screenshot |
| ----- | ---------- |
| holiday | ![Holiday](holiday.png?raw=true "Holiday Screen Shot") |
| halloween | ![Halloween](halloween.png?raw=true "Halloween Screen Shot") |
| fall | ![Fall](fallscreenshot.png?raw=true "Fall Screen Shot") |
| summer | ![Summer](screenshot.png?raw=true "Summer Screen Shot") |
| spring | ![Spring](spring.png?raw=true "Spring Screen Shot") |

## Testing the date script

```console
ZSHTHEME_DATE=2024-07-04 sh get_theme_season.sh
```

*More:*

For more themes and plugins check out https://github.com/unixorn/awesome-zsh-plugins.
