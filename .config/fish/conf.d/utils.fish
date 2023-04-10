function gdiff
  if count $argv > /dev/null
    git diff "$argv" | dunk
  else
    git diff | dunk
  end
end

function fish_command_not_found
  echo "¯\\_(ツ)_/¯ wtf you've just typed: $argv"
end
