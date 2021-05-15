Write-Output "Parameters: [$args]"

function Play-Tune 
{

	param 
	(
        	$Tune
	)

	Add-Type -AssemblyName presentationCore
	$mediaPlayer = New-Object system.windows.media.mediaplayer
	$mediaPlayer.open('songs/' + $Tune + '.mp3')
	$mediaPlayer.Play()
	Write-Output "Parameters: [$Tune]"
}

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:00'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '15:00'))

$PlayFlag = "flags/$(get-date -Format MMdd)-$($args[0])"
Write-Output $PlayFlag-FM

if ($validMorning -or $validAfternoon)
{
	if ($validMorning)
	{
		if (test-path $PlayFlag-FM)
		{
			Write-Output "Already run today!"
		}
		else
		{
			Play-Tune $args[0]
			Write-Output $null >> $PlayFlag-FM
		}
	}

	if ($validAfternoon)
	{
		if (test-path $PlayFlag-EM)
		{
			Write-Output "Already run today!"
		}
		else
		{
			Play-Tune $args[0]
			Write-Output $null >> $PlayFlag-EM
		}
	}	
}
else
{
	Write-Output "$(Get-Date -Format HH:mm) is not a valid time"
}

