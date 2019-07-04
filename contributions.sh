#!/bin/bash
i=1000
for f in contributions/Screenshot*
do
  `convert "$f" -crop 2541x1425+74+74 contributions/$i.png` || echo "Error: convert \"$f\" -crop 2541x1425+74+74 contributions/$i.png"
  `convert contributions/$i.png -geometry 50% contributions/sm_$i.png` || echo "Error: convert contributions/$i.png -geometry 25% contributions/sm_$i.png"
  i=$((i+1))
done
ffmpeg -start_number 1000 -r 7 -i contributions/%04d.png -c:v libx264 -vf fps=7 -pix_fmt yuv420p contributions/video.mp4
convert -loop 0 -delay 15 contributions/sm_10*.png contributions/video.gif
