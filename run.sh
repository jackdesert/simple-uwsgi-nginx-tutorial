#! /bin/bash

# This is a file of various uwsgi invocation tried in the process of finding one
# that works, and works reliably

#sudo uwsgi --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:app --uid www-data --gid www-data



# Added --enable-threads
#sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:app --uid ubuntu --gid ubuntu

# Change from "app" to "application"
# sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --gid ubuntu

# Change back to www-data
#sudo uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid www-data --gid www-data

# Add -H flag
#sudo -H uwsgi --enable-threads --plugin=python3 -s /tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid www-data --gid www-data


# Change to earlier version (from "app" to "application")
#sudo uwsgi --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --gid ubuntu

# Add --chmod-socket !! Works
#sudo uwsgi --chmod-socket=777 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --gid ubuntu


# Reduced chmod to 220 !! Works  (Also works with 020...don't know why)
#sudo uwsgi --chmod-socket=220 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --gid ubuntu

# Running as self (ubuntu) !! Works, but open to anyone!!
#uwsgi --chmod-socket=666 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application 

# Running as self (ubuntu) with setfacl USER rwx   !! Works!
#uwsgi --chmod-socket=660 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application 


# Running as self (ubuntu) with setfacl USER rwx 
#uwsgi --chmod-socket=020 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application 



# Masquerade as ubuntu:www-data with chmod-socket=020
sudo uwsgi --chmod-socket=020 --enable-threads --plugin=python3 -s ~/simple/tmp/simple.sock --manage-script-name --mount /=wsgi:application --uid ubuntu --git www-data

