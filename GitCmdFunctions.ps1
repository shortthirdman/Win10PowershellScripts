function Invoke-GitTagPush {
	param(
	  [Parameter (Mandatory=$true, Position=0, HelpMessage="Tag name of Git release")] [String]$TagName,
	  [Parameter (Mandatory=$true, Position=1, HelpMessage="Tag message description of git release")] [String]$TagMsg,
	  [Parameter (Mandatory=$false, HelpMessage="Make an unsigned, annotated tag object")] [switch]$Unsigned,
	  [Parameter (Mandatory=$false, HelpMessage="Make a GPG-signed tag")] [switch]$Signed
	)
	
	$CreateTagCmd = 'git tag -a -m "$TagMsg" "$TagName"'
	Write-Host -Message "[INFO] Creating a tag from current state/branch" -ForegroundColor Blue
	Invoke-Expression "$CreateTagCmd"

	$PushTagCmd = 'git push origin "$TagName"'
	Write-Host -Message "[INFO] " -ForegroundColor Blue
	Invoke-Expression "$PushTagCmd"
}