#THEN CHECK IF IT HAS BEEN RUN BY CHECKING IF A FILE WITH TODAYS DATE EXISTS
#USE THE SIMPLE CONCEPTS OF FM AND EM

echo "Parameters: [$args]"

$currentTime = 830

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:00'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '15:00'))

if ($validMorning -or $validAfternoon)
{
	echo "Correct time"
	
	if ( 1 -eq 2 ) #HAS BEEN RUN TODAY
	{
		Add-Type -AssemblyName presentationCore
		$mediaPlayer = New-Object system.windows.media.mediaplayer
		$mediaPlayer.open('C:\Users\TaTje\Downloads\' + $args[0] + '.mp3')
		$mediaPlayer.Play()
	}
}

$LastRunTime = Get-Content C:\Users\TaTje\Downloads\current.txt

echo $LastRunTime

Get-Date -Format "MMdd HHmm" | Out-File -FilePath C:\Users\TaTje\Downloads\current.txt