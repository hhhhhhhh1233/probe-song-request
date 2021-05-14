echo "Parameters: [$args]"

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:00'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '15:00'))

if ($validMorning -or $validAfternoon)
{
	if ($validMorning)
	{
		echo "It's morning"
		#Check if it's been run this morning, store the current date in a file called FM or something
	}
	if ($validAfternoon)
	{
		echo "It's afternoon"
		#Check if it's been run this morning, store the current date in a file called EM or something
	}	

	Add-Type -AssemblyName presentationCore
	$mediaPlayer = New-Object system.windows.media.mediaplayer
	$mediaPlayer.open('C:\Users\TaTje\Downloads\' + $args[0] + '.mp3')
	$mediaPlayer.Play()
}
else
{
	echo "$(Get-Date -Format HH:mm) is not a valid time"
}

#$LastRunTime = Get-Content C:\Users\TaTje\Downloads\current.txt

#Get-Date -Format "MMdd HHmm" | Out-File -FilePath C:\Users\TaTje\Downloads\current.txt

