echo "Copying Themes 🧬 \n"
cp lib.zsh ~/.oh-my-zsh/themes/
cp holiday.zsh-theme ~/.oh-my-zsh/themes/
cp newyear.zsh-theme ~/.oh-my-zsh/themes/
cp mlk.zsh-theme ~/.oh-my-zsh/themes/
cp valentine.zsh-theme ~/.oh-my-zsh/themes/
cp presidents.zsh-theme ~/.oh-my-zsh/themes/
cp stpatrick.zsh-theme ~/.oh-my-zsh/themes/
cp easter.zsh-theme ~/.oh-my-zsh/themes/
cp memorial.zsh-theme ~/.oh-my-zsh/themes/
cp juneteenth.zsh-theme ~/.oh-my-zsh/themes/
cp independence.zsh-theme ~/.oh-my-zsh/themes/
cp labor.zsh-theme ~/.oh-my-zsh/themes/
cp columbus.zsh-theme ~/.oh-my-zsh/themes/
cp halloween.zsh-theme ~/.oh-my-zsh/themes/
cp veterans.zsh-theme ~/.oh-my-zsh/themes/
cp thanksgiving.zsh-theme ~/.oh-my-zsh/themes/
cp winter.zsh-theme ~/.oh-my-zsh/themes/
cp spring.zsh-theme ~/.oh-my-zsh/themes/
cp summer.zsh-theme ~/.oh-my-zsh/themes/
cp fall.zsh-theme ~/.oh-my-zsh/themes/
echo "Finished ✨ \n"
echo "To set the theme open your .zshrc file and change ZSH_THEME to either the theme or the get theme script\n"
echo 'ZSH_THEME="holiday"'
echo "or"
echo "ZSH_THEME=\$(sh ~/seasonal-zshthemes/get_theme_season.sh)"
echo "the current theme of the season is $(sh ~/seasonal-zshthemes/get_theme_season.sh)"
