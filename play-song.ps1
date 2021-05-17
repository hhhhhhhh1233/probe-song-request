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

if (!(test-path $('flags/now-playing')))
{
	Write-Output "File flags/now-playing does not exist"
	Write-Output 0 | Out-File -FilePath flags/now-playing
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

$NowPlaying = Get-Content ./flags/now-playing

if (($validMorning -or $validAfternoon) -and ($NowPlaying -eq 0))
{
	if ($validMorning)
	{
		if (test-path $PlayFlag-FM)
		{
			Write-Output "Already run today!"
		}
		else
		{
			Write-Output 1 | Out-File -FilePath ./flags/now-playing
			Write-Output $null >> $PlayFlag-FM
			Invoke-Tune $args[0]
			Write-Output 0 | Out-File -FilePath ./flags/now-playing
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
			Write-Output 1 | Out-File -FilePath ./flags/now-playing
			Write-Output $null >> $PlayFlag-EM
			Invoke-Tune $args[0]
			Write-Output 0 | Out-File -FilePath ./flags/now-playing
		}
	}	
}
elseif ($NowPlaying -eq 1)
{
	Write-Output "A song is already playing"
}
else
{
	Write-Output "$(Get-Date -Format HH:mm) is not a valid time"
}
