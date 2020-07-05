$invoicesFromSAPFile = 'SAP.txt'
$invoicesFromStatementFile = 'statement.txt'

$SAPContent = Get-Content $invoicesFromSAPFile 
$SAPContent | Foreach {$_.TrimEnd()} | Set-Content $invoicesFromSAPFile
$statementContent = Get-Content $invoicesFromStatementFile 
$statementContent | Foreach {$_.TrimEnd()} | Set-Content $invoicesFromStatementFile

Compare-Object ($SAPContent) ($statementContent) -IncludeEqual > SAP_statement_comparison.txt
