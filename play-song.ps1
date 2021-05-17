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

if (!(test-path $('flags/')))
{
	Write-Output "Directory flags/ does not exist"
	New-Item -Type Directory flags >> $null
}

if (!(test-path $('songs/')))
{
	Write-Output "Directory songs/ does not exist"
	New-Item -Type Directory songs >> $null
	Write-Output "Please place .mp3 files into the songs directory before running again"
	exit
}

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

function Invoke-Tune 
{

	param 
	(
        	$Tune
	)

	mpg123 $('songs/' + $Tune + '.mp3')

	Write-Output "Parameters: [$Tune]"
}

$validMorning = ((Get-Date '08:30') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '11:30'))
$validAfternoon = ((Get-Date '12:20') -lt (Get-Date) -and (Get-Date) -lt (Get-Date '15:00'))

$PlayFlag = "flags/$(get-date -Format MMdd)-$($args[0])"

#WRITE THIS TO FILE INSTEAD OF A VARIABLE
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$NowPlaying = 0

if (($validMorning -or $validAfternoon) -and !($NowPlaying))
{
	if ($validMorning)
	{
		if (test-path $PlayFlag-FM)
		{
			Write-Output "Already run today!"
		}
		else
		{
			$NowPlaying = 1
			Write-Output $null >> $PlayFlag-FM
			Invoke-Tune $args[0]
			$NowPlaying = 0

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
			$NowPlaying = 1
			Write-Output $null >> $PlayFlag-EM
			Invoke-Tune $args[0]
			$NowPlaying = 0
		}
	}	
}
elseif ($NowPlaying)
{
	Write-Output "A song is already playing"
}
else
{
	Write-Output "$(Get-Date -Format HH:mm) is not a valid time"
}

