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
    util::enable_service_def {
        'service::crond::crond':
            service => 'crond',
    }
}

