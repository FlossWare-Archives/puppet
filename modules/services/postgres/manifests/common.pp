class services::postgres::common inherits service {
    package { "postgresql":
        ensure => installed,
    }
}
