name 'gravitee'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures gravitee'
long_description 'Installs/Configures gravitee'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'yum-epel'
depends 'java'
depends 'sc-mongodb'
depends 'elasticsearch'
depends 'poise-archive'
