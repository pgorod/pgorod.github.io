$OutPutFile = New-Item -type file -force ".\GroupDetails.csv"
#update filter based on your requirement
# 2 Global distribution group
# 4 Domain local distribution group
# 8 Universal distribution group
# -2147483646 Global security group
# -2147483644 Domain local security group
# -2147483640 Universal security group
$ObjFilter = "(&(objectCategory=Group)(|(groupType=2)(groupType=4)(groupType=8)(groupType=-2147483640)))"
$objSearch = New-Object System.DirectoryServices.DirectorySearcher
$objSearch.SearchRoot = "LDAP://OU=MyBusiness,DC=lumiar,DC=local"
$objSearch.PageSize  = 10000
$objSearch.Filter = $ObjFilter
$Results = $objSearch.FindAll()
foreach ($Result in $Results){
	$Item = $Result.Properties
	$groupName = $Item.cn
	 Write-host $Item.cn
	# $Item.cn | Out-File $OutPutFile -encoding ASCII -append

   foreach ($Member in $Item.member) {
		Write-host "$groupName, $Member"
		"$groupName, $Member" | Out-File $OutPutFile -encoding UTF8 -append
	}
}
