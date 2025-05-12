control 'apache-configuracion' do
  title 'Configuración segura de Apache'
  desc 'Verifica que Apache esté instalado, habilitado y configurado de manera segura.'

  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_enabled }
    it { should be_running }
  end

  describe apache_conf('/etc/apache2/apache2.conf') do
    its('ServerTokens') { should cmp 'Prod' }
    its('ServerSignature') { should cmp 'Off' }
  end
end
