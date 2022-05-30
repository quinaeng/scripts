#!/bin/bash

echo "===================="
echo "   OS Installer   "
echo "===================="

OS_IMAGE="ubuntu.iso"

while true
do
	echo "1 ) Install OS"
	echo ""
	echo "2 ) shell"
	echo ""
	echo -n "input: "
	read input

	case $input in
		1 ) dd if=${OS_IMAGE} of=/dev/sda ;;
		2 ) break ;;
	esac
done

