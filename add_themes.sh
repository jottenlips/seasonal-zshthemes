echo "Copying Themes 🧬 \n"
cp holiday.zsh-theme ~/.oh-my-zsh/themes/
cp halloween.zsh-theme ~/.oh-my-zsh/themes/
cp winter.zsh-theme ~/.oh-my-zsh/themes/
cp fall.zsh-theme ~/.oh-my-zsh/themes/
cp spring.zsh-theme ~/.oh-my-zsh/themes/
cp seashell.zsh-theme ~/.oh-my-zsh/themes/
echo "Finished ✨ \n"
echo "To set the theme open your .zshrc file and change ZSH_THEME to either the theme or the get theme script\n"
echo 'ZSH_THEME="holiday"'
echo "or"
echo "ZSH_THEME=\$(sh ~/seasonal-zshthemes/get_theme_season.sh)"
echo "the current theme of the season is $(sh ~/seasonal-zshthemes/get_theme_season.sh)"