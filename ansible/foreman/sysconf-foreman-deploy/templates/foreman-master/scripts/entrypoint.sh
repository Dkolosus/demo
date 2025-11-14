#!/bin/bash

PATH=/sbin:/usr/sbin:/bin:/usr/bin

export CURL_CA_BUNDLE='/etc/puppetlabs/puppet/ssl/certs/ca.pem'

chown -R nobody:nogroup /usr/share/foreman/public/distr 
chmod -R 777 /usr/share/foreman/public/distr

rm -f /usr/share/foreman/tmp/pids/server.pid

/etc/init.d/apache2 start
exec /usr/bin/java --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED -Xms2G -Xmx2G -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger -XX:ReservedCodeCacheSize=512m -Dlogappender=F1 -XX:+CrashOnOutOfMemoryError -XX:ErrorFile=/var/log/puppetlabs/puppetserver/puppetserver_err_pid%p.log -cp /opt/puppetlabs/server/apps/puppetserver/puppet-server-release.jar:/opt/puppetlabs/server/data/puppetserver/jars/* clojure.main -m puppetlabs.trapperkeeper.main --config /etc/puppetlabs/puppetserver/conf.d --bootstrap-config /etc/puppetlabs/puppetserver/services.d/,/opt/puppetlabs/server/apps/puppetserver/config/services.d/ --restart-file /opt/puppetlabs/server/data/puppetserver/restartcounter &
/etc/init.d/redis-server start

cd /usr/share/foreman-proxy
exec ruby /usr/share/foreman-proxy/bin/smart-proxy & 

cd /usr/share/foreman
exec /usr/bin/bundle3.0 exec --keep-file-descriptors /usr/share/foreman/bin/rails server --environment production
