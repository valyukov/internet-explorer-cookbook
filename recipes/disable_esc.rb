# encoding: utf-8
include_recipe 'windows'

reboot = 'windows_reboot[30]'

registry_get_subkeys('HKU').delete_if { |key | key.end_with? 'Classes' }.each do | user |
  registry_key "HKU\\#{user}\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap" do
    values [{ name: 'IEHarden', type: :dword,  data: 0 }]
    action :create
    notifies :request, reboot, :delayed
  end
  registry_key "HKU\\#{user}\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings" do
    values [{ name: 'IEHardenIENoWarn', type: :dword,  data: 1 }]
    action :create
    notifies :request, reboot, :delayed
  end
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap' do
  values [{ name: 'IEHarden', type: :dword,  data: 0 }]
  action :create
  notifies :request, reboot, :delayed
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\OC Manager\Subcomponents' do
  values [{ name: 'IEHardenAdmin', type: :dword,  data: 0 }]
  action :create
  notifies :request, reboot, :delayed
  recursive true
end

registry_key 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\OC Manager\Subcomponents' do
  values [{ name: 'IEHardenUser', type: :dword,  data: 0 }]
  action :create
  notifies :request, reboot, :delayed
  recursive true
end

registry_key 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}' do
  values [{ name: 'IsInstalled', type: :dword,  data: 0 }]
  action :create
  notifies :request, reboot, :delayed
end

registry_key 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}' do
  values [{ name: 'IsInstalled', type: :dword,  data: 0 }]
  action :create
  notifies :request, reboot, :delayed
end

windows_reboot 30 do
  reason 'Disable IE ESC'
  action :nothing
end
