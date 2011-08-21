class service::crond {
    util::enable_service_def {
        'service::crond::crond':
            service => 'crond',
    }
}

