# encoding: utf-8
name 'internet-explorer'
maintainer 'Vlad Alyukov'
maintainer_email 'v.alyukov@gmail.com'
license 'MIT'
description 'Installs and configure internet-explorer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.2'

supports 'windows'

depends 'windows', '~> 1.31.0'
depends 'powershell', '~> 3.0.4'
