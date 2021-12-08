function _pvm() {
    _alternative "dirs:user directory:($(ls /Library/Application\ Support/appsolute/MAMP\ PRO/conf/ | grep php | sed 's/\.ini//g' | sed 's/php//g' | grep . ))"
}

function pvm() {
    if [ "$1" = "" ]; then
        echo "PHP Version Manager for MAMP Pro (v1.0)"
        echo ""
        echo "Current version: $(php -r 'echo phpversion();')"
        echo ""
        echo "Usage:"
        echo "  pvm list                          Show installed PHP versions"
        echo "  pvm use 8.1.0                     Switch current PHP binary version"
        echo "  pvm 8.1.0                         Run specific PHP version"
        echo "  pvm 8.1.0 file.php                Run file with specific PHP version"
        echo "  pvm 8.1.0 -r \"echo time()\"        Run script from string with specific PHP version"
        echo ""
        return 1
    elif [ "$1" = "list" ]; then
        ls /Library/Application\ Support/appsolute/MAMP\ PRO/conf/ | grep php | sed 's/\.ini//g' | sed 's/php//g' | grep .
    elif [ "$1" = "use" ]; then
        if [ "$2" = "" ]; then
            echo "Please specify a PHP version."
            return 1
        elif test -f "/Applications/MAMP/bin/php/php$2/bin/php"; then
            export PATH=/Applications/MAMP/bin/php/php$2/bin:$PATH
            unalias php
            alias php="/Applications/MAMP/bin/php/php$2/bin/php -c /Library/Application\ Support/appsolute/MAMP\ PRO/conf/php$2.ini"
            echo "Using PHP $2 version."
            return 0
        else
            echo "PHP $2 is not installed."
            return 1
        fi
    elif test -f "/Applications/MAMP/bin/php/php$1/bin/php"; then
        /Applications/MAMP/bin/php/php$1/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php$1.ini" $2
    else
        echo "PHP $1 is not installed."
        return 1
    fi
}

compdef _pvm pvm
