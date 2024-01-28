function Build-DockerImage {
    param (
        [Parameter(Mandatory=$true)]
        [String]$Dockerfile,

        [Parameter(Mandatory=$true)]
        [String]$Tag,

        [Parameter(Mandatory=$true)]
        [String]$Context,

        [Parameter()]
        [String]$ComputerName
    )

    if ($ComputerName) {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {
            docker build -t $using:Tag -f $using:Dockerfile $using:Context
        }
    } else {
        docker build -t $Tag -f $Dockerfile $Context
    }
}

function Copy-Prerequisites {
    param (
        [Parameter(Mandatory=$true)]
        [String]$ComputerName,

        [Parameter(Mandatory=$true)]
        [String[]]$Path,

        [Parameter(Mandatory=$true)]
        [String]$Destination
    )

    $Path | ForEach-Object {
        $sourcePath = $_
        $destinationPath = "\\$ComputerName\$Destination\"
        Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse
    }
}

function Run-DockerContainer {
    param (
        [Parameter(Mandatory=$true)]
        [String]$ImageName,

        [Parameter()]
        [String]$ComputerName,

        [Parameter()]
        [String[]]$DockerParams
    )

    $containerName = if ($ComputerName) {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {
            docker run $using:ImageName $using:DockerParams
        }
    } else {
        docker run $ImageName $DockerParams
    }

    return $containerName
}
