apt-get install -y gcc libyaml-dev libxml2-dev libxslt1-dev zlib1g-dev build-essential openssl libssl-dev libmysqlclient-dev libreadline6-dev libcurl4-openssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev apache2 apache2-mpm-worker git

#Install ruby  from source file
cd /usr/src
wget http://ftp.ruby-lang.org/pub/ruby/ruby-1.9.3-p551.tar.gz
tar -xzf ruby-1.9.3-p551.tar.gz
cd ruby-1.9.3-p551  && ./configure --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib &&  make && make install

gem install capistrano
gem install bundler

gem install passenger -v '4.0.56'
passenger-install-apache2-module
