#I know killall -r don't use this lmao

```
alias bye=" bye() { ps -aux | grep \$1 |  awk '{print \$2}' | xargs kill -9 ; unset -f bye ; }; bye"
```

#If you like to download music from youtube
#Pro tips add --yes-playlist for playlists
```
alias ytmp3='youtube-dl --prefer-ffmpeg --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --ignore-errors --output "%(title)s.%(ext)s"'
:
