class person::name ( $first, $last ) {
    person::name_def {
        "${first}${last}":
            first => $first,
            last  => $last,
    }
}
