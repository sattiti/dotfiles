tell application "Music"
  activate
  set newPreset to make new EQ preset
  set name of newPreset to "_myEQ"
  set band 1 of newPreset to 3
  set band 2 of newPreset to 6
  set band 3 of newPreset to 9
  set band 4 of newPreset to 7
  set band 5 of newPreset to 6
  set band 6 of newPreset to 5
  set band 7 of newPreset to 7
  set band 8 of newPreset to 4
  set band 9 of newPreset to 11
  set band 10 of newPreset to 8
  set preamp of newPreset to 0
  set current EQ preset to newPreset
end tell
