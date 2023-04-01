function Push-DockerImage {
	param(
	  [Parameter (Mandatory=$true, Position=0, HelpMessage="Local tag name of image")] [String]$LocalTagName,
	  [Parameter (Mandatory=$true, Position=0, HelpMessage="Remote tag name of image for Docker Hub")] [String]$RemoteTagName
	)

	$tagCmd = 'docker tag "$LocalTagName" "$RemoteTagName"'
	$pushCmd = 'docker push "$RemoteTagName"'
	
	Write-Host -Message "[INFO] Tagging local and remote images" -ForegroundColor Blue
	Invoke-Expression "$tagCmd"

	Write-Host -Message "[INFO] Pushing tagged remote images to Docker Hub" -ForegroundColor Blue
	Invoke-Expression "$pushCmd"
}