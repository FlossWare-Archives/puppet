class service::nfs::server ( $dir, $domain, $permissions ) inherits service::nfs:base {
    $exportMap = {
        dir         => $dir,
        domain      => $domain,
        permissions => $permissions,
    }

    class {
        'service::nfs::mapped_server':
            exportMap => $exportMap,
    }
}
