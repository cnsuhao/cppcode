if [[ ! -d /UnrealEngine3 ]]; then
	sudo mkdir /UnrealEngine3
	sudo chmod 777 /UnrealEngine3 
	sudo mkdir -p /Library/MobileDevice/Provisioning\ Profiles
	sudo chmod 777 /Library/MobileDevice/Provisioning\ Profiles
fi

chmod a+x UnrealRemoteTool
for (( ;; )) do ./UnrealRemoteTool; done;
