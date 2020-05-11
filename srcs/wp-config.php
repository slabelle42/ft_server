<?php
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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+T9iXSi?hEhn![aM~`jD?AGt!7O>2v(t;3{a1wARTt_f^uzUe*bu+]WMonCcvlPf');
define('SECURE_AUTH_KEY',  'k_C`+HuyX_ySB1KVWtKc: ZST~vC6bB}!IO8);mul >BfJf94$7VBGe)nuBX3Eh^');
define('LOGGED_IN_KEY',    '$ew[&)WF&DAG?mt=j5Bvb%iU4* I24;,`&.pd _ELs1gE8sx/pnqpNhD5k}WF|;,');
define('NONCE_KEY',        '0g?) ^@bOVb[q$ulm0uwa<|E]A*LD3%Y7`s}mW*;;ePsbuO<C%|fCGa@_{ku;KFX');
define('AUTH_SALT',        'Ao|zp+Q8^[:+SO/#RId|,Q)5>z+-x${acab|=`cRu-fG/_RJowig:3$O*Rk<Kljt');
define('SECURE_AUTH_SALT', 'eDP6F/C|C!56OYlzu|Bq+z.BG[u7[PY@FSxwWf7 7vc>{=jMY})}X5>QNn~_g}W#');
define('LOGGED_IN_SALT',   'bPk~7?(S!q#=[v0pp$1~kT+?GHpio}DAa7pi3Aj+P]H(,}P;|ZZ;PB!`7-/SRX8%');
define('NONCE_SALT',       'p=vuN5H+[JqpY06oTRrO?&vHI&1&-)9xKSD{48n_u8J?|E7jq.&O6M;WMI!c4.Ij');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
