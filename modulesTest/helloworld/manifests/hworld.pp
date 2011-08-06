class helloworld::hworld ( $var1, $var2 ) {
    helloworld::hello_world {
        "${var1}${var2}":
            var1 => $var1,
            var2 => $var2,
    }
}
