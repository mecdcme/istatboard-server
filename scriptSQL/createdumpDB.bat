echo %DATE%
echo %TIME%
set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2%
echo %datetimef%
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" -u root -p hack > "G:\worspaces_eclipse\ws_eclipse_oxygen\AngularBe\clientApp\istatboard-server\scriptSQL\hack_db_"%datetimef%".sql"