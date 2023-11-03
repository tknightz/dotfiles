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

function memtake
  set program_name $argv[1]

  set process_ids (pgrep -f $program_name)
  set total_ram_usage 0

  for pid in $process_ids
    set ram_usage (ps -p $pid -o rss=)
    set total_ram_usage (math $total_ram_usage + $ram_usage)
  end

  # Convert total RAM usage to bytes
  set total_ram_usage_bytes (math "$total_ram_usage * 1024")

  # Format total RAM usage in bytes for human-readable output
  set formatted_ram_usage_bytes (echo $total_ram_usage_bytes | numfmt --to=iec)

  echo $formatted_ram_usage_bytes
end

function playing_info
  set raw_metadata (playerctl metadata -a -f '{{lc(status)}}: {{title}}')

  if test "$raw_metadata" = "No players found"
    echo ""
    return
  end

  set lines (echo "$raw_metadata" | string split -n "\n")
  for line in $lines
    if string match --regex --quiet '^playing' $line
      set song_title (echo $line | string replace -r '^playing: ' '')
      if test (string length $song_title) -lt 30
        echo $song_title
      else
        set song_title (string sub --start 1 --length 30 $song_title)'....'
        echo $song_title
      end
      return
    end
  end

  echo ""
end
