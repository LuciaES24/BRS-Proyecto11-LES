control 'ssh-configuracion' do
  title 'Configuración segura de SSH'
  desc 'Verifica que el servicio SSH esté instalado, habilitado y configurado de manera segura.'

  describe package('openssh-server') do
    it { should be_installed }
  end

  describe service('ssh') do
    it { should be_enabled }
    it { should be_running }
  end

  describe sshd_config do
    its('PermitRootLogin') { should cmp 'no' }
    its('PasswordAuthentication') { should cmp 'no' }
    its('Port') { should cmp '22' }
  end
end
