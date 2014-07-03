include_recipe 'windows'

registry_key 'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' do
  values [{ name: 'DisableFirstRunCustomize', type: :dword,  data: 1 }]
  action :create
  recursive true
end
