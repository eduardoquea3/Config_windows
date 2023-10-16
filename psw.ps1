Import-Module -Name Terminal-Icons
Invoke-Expression (&starship init powershell)

Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function HistorySearchForward

# Asigna la combinación de teclas "Ctrl + E" para ejecutar el comando actual
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function AcceptLine

function uvim {
  Set-Location -Path "C:\Users\eduar\AppData\Local\nvim\"
}

Set-Alias -Name cdn -Value uvim
Set-Alias -Name lg -Value lazygit

fnm env --use-on-cd | Out-String | Invoke-Expression
