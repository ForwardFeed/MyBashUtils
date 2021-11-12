#!/bin/bash

### Parameters variables
	
#@p for from the miniature left click to the copy link i have to decrease the cursor from some pixels
# personnal freetube stuff
decrease_to_copylink=("-43" "-80")


#<


### Functions

#@r void
#@p 
copy_link_from_mouse_position(){
	# get location of the mouse in an array
	 m_loc=($(xdotool getmouselocation | grep -Eo "[0-9 ]*"))
	 # echo ${m_loc[0]} ${m_loc[1]}
	 xdotool click 3
	 xdotool mousemove $((${m_loc[0]} - ${decrease_to_copylink[0]})) $((${m_loc[1]} - ${decrease_to_copylink[1]}))
	 xdotool click 1
}

#setup all parameters and print out to the stdout
setup_params(){
	# to fake the selector
	xwininfo > /dev/null
	#retrieve the coords
	click_miniature=($(xdotool getmouselocation | grep -Eo "[0-9 ]*"))
	xdotool click 3
	sleep 2
	#xwininfo > /dev/null
	clickcopylink=($(xdotool getmouselocation | grep -Eo "[0-9 ]*"))
	#from the upper click to the underclick get the differences
	x_corrector=$((${click_miniature[0]}-${clickcopylink[0]}))
	y_corrector=$((${click_miniature[1]}-${clickcopylink[1]}))
	echo $x_corrector $y_corrector
}

#convert link of image in youtube video

print_video_link(){
	base_ytb_link="https://youtu.be/"
	img_link=$(xclip -selection clipboard -o | grep -Po "/vi/\K\b[^/]*")
	echo ${base_ytb_link}${img_link}
}
#<

### Input guards

if [ "$1" == "-s" ]
then
	setup_params
	return 0
fi

### Main Function

#decrease_to_copylink=($(setup_params))
#echo ${decrease_to_copylink[@]}
sleep 1.5
copy_link_from_mouse_position
print_video_link
