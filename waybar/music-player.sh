status=$(playerctl status 2>/dev/null)
metadata=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null | awk '{
  if (length($0) > 26)
    print substr($0, 1, 26) "…";
  else
    print;
}')

if [ "$status" = "Playing" ]; then
  echo 󰝚 "$metadata"
elif [ "$status" = "Paused" ]; then
  echo 󰏥 "$metadata"
else
  echo "󰝛 Nothing playing"
fi
