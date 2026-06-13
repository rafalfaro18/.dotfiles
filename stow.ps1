param (
    [Parameter(Position = 0, Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]]$Packages,

    [string]$Dir = ".",     # Corresponds to stow -d
    [string]$Target = $HOME # Corresponds to stow -t
)

# Helper function to process the directory tree exactly like Stow
function Stow-Node {
    param ($SourceNode, $TargetNode)

    # Coreutils equivalent: list all directory items (including hidden files)
    $items = &"C:\Program Files\coreutils\bin\ls.exe" -A $SourceNode

    foreach ($item in $items) {
        $srcItem = Join-Path $SourceNode $item
        $tgtItem = Join-Path $TargetNode $item

        $srcIsDir = (Get-Item $srcItem).Attributes.HasFlag([System.IO.FileAttributes]::Directory)
        $tgtExists = Test-Path $tgtItem

        if ($tgtExists) {
            $tgtIsDir = (Get-Item $tgtItem).Attributes.HasFlag([System.IO.FileAttributes]::Directory)
            $tgtIsLink = (Get-Item $tgtItem).Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)

            # Scenario A: Target directory exists and is a real folder -> Recurse inside it
            if ($srcIsDir -and $tgtIsDir -and -not $tgtIsLink) {
                Stow-Node -SourceNode $srcItem -TargetNode $tgtItem
            }
            # Scenario B: Target exists but is a symlink or conflicts with a file -> Skip/Conflict
            else {
                Write-Host "CONFLICT: $tgtItem already exists. Skipping." -ForegroundColor Red
            }
        }
        else {
            # Scenario C: Target does NOT exist. Create a symlink here.
            &"C:\Program Files\coreutils\bin\ln.exe" -s $srcItem $TargetNode
            Write-Host "Linked: $tgtItem -> $srcItem" -ForegroundColor Green
        }
    }
}

# Iterate through every package passed to the command
foreach ($Package in $Packages) {
    $PackagePath = Resolve-Path (Join-Path $Dir $Package) -ErrorAction SilentlyContinue
    $TargetPath = Resolve-Path $Target

    if (-not $PackagePath) {
        Write-Warning "Package directory '$Package' does not exist in '$Dir'. Skipping."
        continue
    }

    Write-Host "Stowing package: $Package" -ForegroundColor Cyan
    Stow-Node -SourceNode $PackagePath -TargetNode $TargetPath
}
