<# This short program will attempt to filter an entire list of files by the length of their name and print the output into an array and on screen.#>

<# I personally need this to filter for files with a name longer than 63 characters for various reasons, so that's where we'll start.#>


$FileList = Get-ChildItem -Path '.\SC_IMAC Server\' -Recurse | Select-Object Name, FullName
$FileArray = @()

foreach ($File in $FileList) {
    $FileName = $File.Name
    if ($FileName.length -gt 63) {
        $FileArray += $File.FullName
        Write-Output $FileName
    }
}
$FileArray | Export-Csv -Path C:\Temp\Long-file-names.csv