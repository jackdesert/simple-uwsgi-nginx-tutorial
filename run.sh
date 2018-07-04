#! /bin/bash

#sudo uwsgi --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:app --uid www-data --gid www-data



# Added --enable-threads
#sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:app --uid ubuntu --gid ubuntu

# Change from "app" to "application"
# sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --gid ubuntu

# Change back to www-data
#sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid www-data --gid www-data

# Add -H flag
sudo -H uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid www-data --gid www-data
