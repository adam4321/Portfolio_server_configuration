<?php
define('WP_HOME','http://157.245.236.144/blog');
define('WP_SITEURL','http://157.245.236.144/blog');
/** Enable W3 Total Cache */
define('WP_CACHE', true); // Added by W3 Total Cache

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'bnticmhq_wp1');

/** MySQL database username */
define('DB_USER', 'bnticmhq_admin');

/** MySQL database password */
define('DB_PASSWORD', 'gqUZD!T!Z[xV');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'u3ajdb3zpzd5bpckmp6n6q95hxxktsbsu6vp9uzx9vq7msjt8rnrxswpqlcp1rjq');
define('SECURE_AUTH_KEY',  'jyr9ebqx1var7ahh6qzbbgxob7fb3jxyf6nrmsbj9gqwszbgm2oeridibxhnvalm');
define('LOGGED_IN_KEY',    'zjusrsct8hzh9uvbhg51ezrw1maxwofsj50m096fdjekckuwkkqpsftq64dfa9v6');
define('NONCE_KEY',        'rzpkxlgkrqe3uncu5m2l07sbvmcn5tq3xnjgkm5xdldtrxhf1b0ofa5hxshq8ft2');
define('AUTH_SALT',        'phfbrcgvwjmm01dix9100mquflnlfnojc5lmysvawrk3xvszvszeoymnjiquzw75');
define('SECURE_AUTH_SALT', '5iwcljjb2lgjvhdtkmwhkfqp7z9iuu4xddwixx3yfqwvtl8cd377vvooa0huekow');
define('LOGGED_IN_SALT',   'ny1fqz8j0k2kp2ncfqyvvltaytwtfvzpmqibdldkd3a9my0waqe0sm9acfy39zyr');
define('NONCE_SALT',       '5n0ln7eixqiyu2vg05xtbicwiznxaozmzsesjbdh2v8kguw4kapwlrhnqz6jlw2x');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp5i_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
