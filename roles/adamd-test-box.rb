# https://adamcod.es/2013/01/15/vagrant-is-easy-chef-is-hard-part2.html
# Name of the role should match the name of the file
name "adamd-test-box"
default_attributes(
    "build_essential" => {
        "compiletime" => true
    }
)
# MySQL db connection basics (for setup only)
override_attributes(
    "mysql" => {
        "server_root_password" => 'fe304dcb0a01a!1',
        "server_repl_password" => 'fe304dcb0a01a!1',
        "server_debian_password" => 'fe304dcb0a01a!1'
    }
)
# Recipes to run, in the correct sequence
run_list(
    "recipe[build-essential]",
    "recipe[openssl]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[mysql]",
    "recipe[mysql::server]",
    "recipe[php]",
    "recipe[php::module_mysql]",
    "recipe[apache2::vhosts]",
    "recipe[database::mysql]",
    "recipe[database::import]"
)