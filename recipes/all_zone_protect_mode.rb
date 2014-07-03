# encoding: utf-8
include_recipe 'windows'

zones_template = 'HKU\%s\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones'

reboot = 'windows_reboot[30]'

registry_get_subkeys('HKU').reject { |key | key.end_with? 'Classes' }.each do | user |
  zones = zones_template % user
  registry_get_subkeys(zones).each do | zone |
    registry_key "#{zones}\\#{zone}" do
      values [{ name: '2500', type: :dword,  data: 0 }]
      action :create
      notifies :request, reboot, :delayed
    end
  end
end

windows_reboot 30 do
  reason 'Disable IE ESC'
  action :nothing
end
