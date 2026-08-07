#!/usr/bin/env bash
# Prints the zsh theme for today's season or holiday.
# Override the date for testing with: ZSHTHEME_DATE=2024-07-04 sh get_theme_season.sh

date_str=${ZSHTHEME_DATE:-$(date +%Y-%m-%d)}
year=$((10#${date_str%%-*}))
rest=${date_str#*-}
month=$((10#${rest%%-*}))
day=$((10#${rest##*-}))

# Portable date helpers (GNU/Linux vs BSD/macOS).
if date -d "$date_str" +%u >/dev/null 2>&1; then
  dow()  { date -d "$1" +%u; }                     # day of week, 1=Mon..7=Sun
  last() { date -d "$1 + 1 month - 1 day" +%d; }   # last day of month
else
  dow()  { date -j -f "%Y-%m-%d" "$1" +%u; }
  last() { date -j -v+1m -v-1d -f "%Y-%m-%d" "$1" +%d; }
fi

mdate() { printf "%04d-%02d-%02d" "$1" "$2" "$3"; }

# nth (1-5) weekday (1=Mon..7=Sun) of a month.
nth_dow() {
  d1=$(mdate "$1" "$2" 1)
  dow1=$(dow "$d1")
  first=$(( ( $3 - dow1 + 7 ) % 7 + 1 ))
  echo $(( first + ($4 - 1) * 7 ))
}

# Easter Sunday (Gregorian computus).
a=$(( year % 19 ))
b=$(( year / 100 ))
c=$(( year % 100 ))
d=$(( b / 4 ))
e=$(( b % 4 ))
f=$(( (b + 8) / 25 ))
g=$(( (b - f + 1) / 3 ))
h=$(( (19*a + b - d - g + 15) % 30 ))
i=$(( c / 4 ))
k=$(( c % 4 ))
l=$(( (32 + 2*e + 2*i - h - k) % 7 ))
m=$(( (a + 11*h + 22*l) / 451 ))
easter_month=$(( (h + l - 7*m + 114) / 31 ))
easter_day=$(( ((h + l - 7*m + 114) % 31) + 1 ))

# Fixed-date holidays.
[ "$date_str" = "$(mdate "$year" 1 1)" ]   && echo newyear      && exit # New Year's Day
[ "$date_str" = "$(mdate "$year" 2 14)" ]  && echo valentine    && exit # Valentine's Day
[ "$date_str" = "$(mdate "$year" 3 17)" ]  && echo stpatrick    && exit # St. Patrick's Day
[ "$date_str" = "$(mdate "$year" 6 19)" ]  && echo juneteenth   && exit # Juneteenth
[ "$date_str" = "$(mdate "$year" 7 4)" ]   && echo independence && exit # Independence Day
[ "$date_str" = "$(mdate "$year" 10 31)" ] && echo halloween    && exit # Halloween
[ "$date_str" = "$(mdate "$year" 11 11)" ] && echo veterans     && exit # Veterans Day
[ "$date_str" = "$(mdate "$year" 12 24)" ] && echo holiday      && exit # Christmas Eve
[ "$date_str" = "$(mdate "$year" 12 25)" ] && echo holiday      && exit # Christmas
[ "$date_str" = "$(mdate "$year" 12 31)" ] && echo newyear      && exit # New Year's Eve

# Floating holidays.
[ "$date_str" = "$(mdate "$year" 1 "$(nth_dow "$year" 1 1 3)")" ]  && echo mlk        && exit # MLK Day
[ "$date_str" = "$(mdate "$year" 2 "$(nth_dow "$year" 2 1 3)")" ]  && echo presidents && exit # Presidents' Day
[ "$date_str" = "$(mdate "$year" "$easter_month" "$easter_day")" ] && echo easter     && exit # Easter Sunday

may_last=$(last "$(mdate "$year" 5 1)")
memorial=$(( may_last - ( $(dow "$(mdate "$year" 5 "$may_last")") - 1 ) ))
[ "$date_str" = "$(mdate "$year" 5 "$memorial")" ] && echo memorial && exit # Memorial Day

[ "$date_str" = "$(mdate "$year" 9 "$(nth_dow "$year" 9 1 1)")" ]  && echo labor       && exit # Labor Day
[ "$date_str" = "$(mdate "$year" 10 "$(nth_dow "$year" 10 1 2)")" ] && echo columbus   && exit # Columbus Day
[ "$date_str" = "$(mdate "$year" 11 "$(nth_dow "$year" 11 4 4)")" ] && echo thanksgiving && exit # Thanksgiving

# Otherwise, season by month.
case $month in
  12|1|2)  echo winter ;;
  3|4|5)   echo spring ;;
  6|7|8)   echo summer ;;
  9|10|11) echo fall ;;
esac
