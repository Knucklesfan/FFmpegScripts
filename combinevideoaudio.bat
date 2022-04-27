@echo off 
set /p video=Drag a video:
set /p audio=Drag some audio:
set /p start=Audio Start Time:
set /p vstart=Video Start Time:
set /p vlength=Video Length:
set /p top=Bottom Text:
set /p topsz=Bottom Text Size:
set /p bottom=Top Text:
set /p bottomsz=Top Text Size:
set /p speed=Speed: Number less than 1 to go faster (decimals): Greater than 1 to go slower. Has to be greater than 0:

set /p filename=Filename:
ffmpeg.exe -ss %vstart% -i %video% -ss %start% -i %audio% -vf "drawtext=fontfile=impact.ttf: text='%top%': start_number=1: x=(w-tw)/2: y=h-(lh+16): fontcolor=white: fontsize=%topsz%: bordercolor=black: borderw=4","drawtext=fontfile=impact.ttf: text='%bottom%': start_number=1: x=(w-tw)/2: y=16: fontcolor=white: fontsize=%bottomsz%: bordercolor=black: borderw=4","setpts=%speed%*PTS","scale=trunc(iw/4)*2:trunc(ih/4)*2" -c:a copy -map 0:0 -map 1:0 -crf 20 -to %vlength% %filename%.mp4
pause
