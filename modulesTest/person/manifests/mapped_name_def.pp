define person::mapped_name_def ( $nameMap = $name ) {
    person::name_def {
        $nameMap:
            first => $nameMap [ "first" ],
            last  => $nameMap  [ "last"  ],
    }
}
