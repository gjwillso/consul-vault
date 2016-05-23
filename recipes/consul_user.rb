group node['consul-vault']['group']

user node['consul-vault']['user'] do
  group node['consul-vault']['group']
  system true
  shell '/bin/bash'
end
