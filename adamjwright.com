###############################################################################
##  Description:  NGINX configuration file for the initial entrypoint for
##                personal portfolio website adamjwright.com.
##
##                - The root location serves the portfolio site and all other
##                  routes are links which are called from it.
##
##                - This configuration file's path: /etc/nginx/sites-available
##
##                - Web root's path: /var/www/adamjwright.com/html
###############################################################################

# Include ssl credentials
ssl_certificate /etc/letsencrypt/live/adamjwright.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/adamjwright.com/privkey.pem;


# Redirect all http traffic to SSL --------------------------------------------
server {
    listen 80;
    server_name www.adamjwright.com adamjwright.com;

    # Redirects both www and non-www to https
    return 301 https://adamjwright.com$request_uri;
}


# Redirect all www SSL traffic ------------------------------------------------
server {
    listen 443 ssl http2;
    server_name www.adamjwright.com;

    # Redirect www to non-www
    return 301 https://adamjwright.com$request_uri;
}


# Server configuration after potential redirect -------------------------------
server {
	# SSL configuration
	listen 443 ssl http2;

    # Website Hostname
	server_name adamjwright.com;

    # Path to the web root of the website
	root /var/www/adamjwright.com/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.php index.nginx-debian.html;


    # Home page route ---------------------------------------------------------
	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # Amp Library page route --------------------------------------------------
    location /amp_library {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # Quote generator page route ----------------------------------------------
    location /quote_generator {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # Drum Machine page route -------------------------------------------------
    location /drum_machine {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # Markdown previewer page route -------------------------------------------
    location /markdown_previewer {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # React Calculator page route ---------------------------------------------
    location /react_calculator {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

    # WASM Maze Game page route -----------------------------------------------
    location /wasm_maze_game {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}


    # Wordpress blog route ----------------------------------------------------
    location /blog {
        try_files $uri $uri/ /blog/index.php$is_args$args;
    }

    # Pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }


    # Bugtracker node server route --------------------------------------------
    location ^~ /bug_tracker/ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://127.0.0.1:50000;
    }

    # Weather Widget node server route ----------------------------------------
    location ^~ /weather_widget/ {
		proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_pass http://127.0.0.1:6060;
	}
}
