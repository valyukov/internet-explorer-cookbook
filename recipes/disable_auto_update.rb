registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main' do
  values [{ name: 'EnableAutoUpgrade', type: :dword,  data: 0 }]
  action :create
  recursive true
  only_if { node[:ie][:version] >= 10 }
end
