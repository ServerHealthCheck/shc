#!/bin/bash
language=$(locale | grep LANG | cut -d'=' -f2)

case "$language" in
	"en_GB.UTF-8")
		echo $(lscpu | grep "Model name" | cut -d':' -f2)
	;;
		
	"en_US.UTF-8" < "en_US.utf8")
		echo $(lscpu | grep "Model name" | cut -d':' -f2)
	;;
	
	"de_DE.UTF-8")
		echo $(lscpu | grep "Modellname" | cut -d':' -f2)
	;;
	
	*)
		echo "Not a supported language: $language"
		exit
	;;
esac	
