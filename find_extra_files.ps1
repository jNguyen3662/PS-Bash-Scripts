#The purpose of this script is to identify any extra files that are in the directory.  
#The script looks for files that match patterns listed line by line in files_to_look_for
#and ignores files that match patterns in the $ignorePattern variable.
#Any remaining file at the end gets outputted into extra_files.txt

#file with invoice numbers, typically, but can contain other patterns
$textFileWithAllFiles = 'files_to_look_for.txt' 

#regex that tells this script which files to ignore    
$ignorePattern = '\d\d\d-\d\d-\d\d\d\d|files_to_look_for|extra_files'

#Note: for crash course in regex go here: 
#https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285


#create an ArrayList of all the files in current directory, ignore files that regex match $ignorePattern
$directoryFilesArray = Get-ChildItem -recurse | Where-Object{ $_.Name -NotMatch $ignorePattern}| Foreach-Object {$_.Name}
$directoryFilesArrayList = [System.Collections.ArrayList]@($directoryFilesArray)

#create string array of all the patterns to match in files_to_look_for.txt
[string[]]$pattern= Get-Content -Path $textFileWithAllFiles

#loop through all patterns and eliminate all files from $directoryFilesArrayList that match the patterns.
For ($i = 0; $i -lt $pattern.Length; $i++) {
    $directoryObject = Get-ChildItem -Recurse | Where-Object { $_.FullName -match $pattern[$i] }
    $directoryObjectLength = Get-ChildItem -Recurse | Where-Object { $_.FullName -match $pattern[$i] }|Measure-Object

    if($directoryObject) {
        For ($j = 0; $j -lt $directoryObjectLength.Count; $j++) {
            $directoryFilesArrayList.Remove($directoryObject[$j].Name)
        }
    }
}

#output remaining files to extra_files.txt
$directoryFilesArrayList > extra_files.txt