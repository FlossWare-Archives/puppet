# Enables the crond service.
#
# == Parameters
#
# == Variables
#
# == Examples
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::crond {
    service {
        'crond':
            ensure  => running,
            enable  => true,
    }
}

