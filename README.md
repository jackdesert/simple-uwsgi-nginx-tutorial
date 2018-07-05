Simple
======

    sudo apt install uwsgi-core uwsgi-plugin-python3 python3-pip htop nginx

    pip3 install flask
    > Installing collected packages: click, MarkupSafe, Jinja2, Werkzeug, itsdangerous, flask

    $ which flask
    /home/ubuntu/.local/bin/flask


    cd simple
    python3 wsgi.py # this verifies that some of the pieces fire

    $ curl localhost:5000
    <h1 style='color:blue'>Hello There!</h1>

    cd /etc/nginx/sites-enabled/
    sudo rm default
    sudo ln -s /home/ubuntu/simple/simple-nginx.conf
    sudo nginx -s reload

    mkdir tmp
    #setfacl -Rm g:users:rwX,d:g:users:rwX ~/simple/tmp
    #setfacl -Rdm u:www-data:rw ~/simple/tmp
    #setfacl -Rm d:u:www-data:rw,u:www-data:rwx ~/simple/tmp
    setfacl -Rm d:u:www-data:rwx,u:www-data:rwx ~/simple/tmp

    # If you want to remove the setfacl settings, just `setfacl -b tmp`

