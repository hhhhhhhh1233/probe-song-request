Write-Output "Parameters: [$args]"

function Play-Tune {

	param (
        $Tune
    )

	Add-Type -AssemblyName presentationCore
	$mediaPlayer = New-Object system.windows.media.mediaplayer
	$mediaPlayer.open('C:\Users\TaTje\Downloads\' + $Tune + '.mp3')
	$mediaPlayer.Play()
	Write-Output "Parameters: [$Tune]"
}

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:00'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '17:00'))

$PlayFlag = "$(get-date -Format MMdd)-$($args[0])"
Write-Output FM-$PlayFlag

if ($validMorning -or $validAfternoon)
{
	if ($validMorning)
	{
		if (test-path FM-$PlayFlag)
		{
			Write-Output "Already run today!"
		}
		else
		{
			Play-Tune $args[0]
			Write-Output $null >> FM-$PlayFlag
		}
	}

	if ($validAfternoon)
	{
		if (test-path EM-$PlayFlag)
		{
			Write-Output "Already run today!"
		}
		else
		{
			Play-Tune $args[0]
			Write-Output $null >> EM-$PlayFlag
		}
	}	
}
else
{
	Write-Output "$(Get-Date -Format HH:mm) is not a valid time"
}

