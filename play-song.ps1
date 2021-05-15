if (Get-Command mpg123 -errorAction SilentlyContinue)
{
	mpg123 --version
}
else
{
	Write-Output "mpg123 is not installed"
	exit
}

Write-Output "Parameters: [$args]"

if ($args.Count -eq 0)
{
	Write-Output "You must have at least one argument"
	exit
}

if (!(test-path $('songs/' + $args[0] + '.mp3')))
{
	Write-Output $($args[0] + ".mp3 does not exist")
	exit
}

function Play-Tune 
{

	param 
	(
        	$Tune
	)

	mpg123 $('songs/' + $Tune + '.mp3')

	Write-Output "Parameters: [$Tune]"
}

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:00'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '15:00'))

$PlayFlag = "flags/$(get-date -Format MMdd)-$($args[0])"

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

