. "$PSScriptRoot\..\Save-Module\Save-Module.Cmd.ps1"

$moduleName = "simplysql"
Save-Module $moduleName

function LLM {
  $databasePath = "D:\Multimédia\Documents\PowerShell\database.sqlite"
  Open-SQLiteConnection -ConnectionString "Data Source=$databasePath;Version=3;"

  # Invoke-SqlQuery -Query "
  #   CREATE TABLE user (
  #     id INTEGER PRIMARY KEY,
  #     username TEXT NOT NULL,
  #     email TEXT UNIQUE NOT NULL,
  #     password TEXT NOT NULL,
  #     created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  #   );
  # "

  # Invoke-SqlQuery -Query "
  #   INSERT INTO user (username, email, password) 
  #   VALUES ('Bluzzi', 'bluzzi@email.com', 'test');
  # "

  # Invoke-SqlQuery -Query "
  #   INSERT INTO user (username, email, password) 
  #   VALUES ('Unarray', 'unarray@email.com', 'test2');
  # "

  $result = Invoke-SqlQuery -Query "SELECT * FROM user"
  Write-Host ($result | Format-List | Out-String)
}