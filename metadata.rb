name 'internet-explorer'
maintainer 'Vlad Alyukov'
maintainer_email 'v.alyukov@corp.mail.ru'
license 'Apache 2.0'
description 'Installs internet-explorer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.1'

supports 'windows'

depends 'windows', '~> 1.31.0'
depends 'powershell', '~> 3.0.4'
