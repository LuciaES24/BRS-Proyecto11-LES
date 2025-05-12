control 'ufw-configuracion' do
  title 'Configuración del firewall UFW'
  desc 'Verifica que UFW esté instalado, habilitado y con las reglas adecuadas.'

  describe package('ufw') do
    it { should be_installed }
  end

  describe service('ufw') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('ufw status') do
    its('stdout') { should match /Status: active/ }
    its('stdout') { should match /22\/tcp\s+ALLOW/ }
    its('stdout') { should match /80\/tcp\s+ALLOW/ }
  end
end
