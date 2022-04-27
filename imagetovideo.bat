@echo off 
set /p video=Drag a image:
set /p audio=Drag some audio:
set /p start=Audio Start Time:
set /p vlength=Video Length:
set /p filename=Filename:

ffmpeg -loop 1 -i %video% -ss %start% -i %audio% -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -c:v libx264 -t %vlength% -pix_fmt yuv420p out.mp4

pause