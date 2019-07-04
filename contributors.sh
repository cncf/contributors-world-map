#!/bin/bash
i=1000
for f in contributors/Screenshot*
do
  `convert "$f" -crop 2541x1425+74+74 contributors/$i.png` || echo "Error: convert \"$f\" -crop 2541x1425+74+74 contributors/$i.png"
  `convert contributors/$i.png -geometry 50% contributors/sm_$i.png` || echo "Error: convert contributors/$i.png -geometry 25% contributors/sm_$i.png"
  i=$((i+1))
done
ffmpeg -start_number 1000 -r 7 -i contributors/%04d.png -c:v libx264 -vf fps=7 -pix_fmt yuv420p contributors/video.mp4
convert -loop 0 -delay 15 contributors/sm_10*.png contributors/video.gif
