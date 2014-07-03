# encoding: utf-8
default[:ie][:version] = 8
default[:ie][:installer][:args] = '/quiet /norestart'

case node[:ie][:version]
when 9
  default[:ie][:installer][:pkg] = 'http://download.microsoft.com/download/C/1/6/C167B427-722E-4665-9A40-A37BC5222B0A/IE9-Windows7-x64-enu.exe'
when 10
  default[:ie][:installer][:pkg] = 'http://download.microsoft.com/download/C/E/0/CE0AB8AE-E6B7-43F7-9290-F8EB0EA54FB5/IE10-Windows6.1-x64-en-us.exe'
when 11
  default[:ie][:installer][:pkg] = 'http://download.microsoft.com/download/7/1/7/7179A150-F2D2-4502-9D70-4B59EA148EAA/IE11-Windows6.1-x64-en-us.exe'
else
  default[:ie][:installer][:pkg] = nil
  default[:ie][:installer][:args] = nil
end
