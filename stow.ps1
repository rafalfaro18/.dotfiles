param (
    [Parameter(Position = 0, Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]] $Packages,

    [string] $Dir   = ".",        # stow -d
    [string] $Target = $HOME      # stow -t
)

function Stow-Node {
    param (
        [Parameter(Mandatory)] [string] $SourceNode,
        [Parameter(Mandatory)] [string] $TargetNode
    )
    $items = & "C:\Program Files\coreutils\bin\ls.exe" -A "$SourceNode"
    foreach ($item in $items) {
        $srcItem  = Join-Path $SourceNode $item
        $linkPath = Join-Path $TargetNode $item

        $srcIsDir = (Get-Item $srcItem).PSIsContainer

        if (Test-Path $linkPath) {
            Write-Host "CONFLICT: $linkPath already existor Red
            continue
        }

        if ($srcIsDir) {
            & "C:\Program Files\coreutils\bin\mkdir.exe"
            Write-Host "Created folder: $linkPath" -Foreg
            Stow-Node -SourceNode $srcItem -TargetNode $l
        }
        else {
            & "C:\Program Files\coreutils\bin\ln.exe" -s
            Write-Host "Linked: $linkPath -> $srcItem" -F
        }
    }
}

foreach ($Package in $Packages) {
    $PackagePath = Resolve-Path (Join-Path $Dir $Package)e
    if (-not $PackagePath) {
        Write-Warning "Package directory '$Package' does ."
        continue
    }

    Write-Host "Stowing package: $Package" -ForegroundCol
    Stow-Node -SourceNode $PackagePath -TargetNode $Targe
}
