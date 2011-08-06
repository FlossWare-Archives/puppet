define helloworld::mapped_hello_world ( $vars = $name ) {
    hello_world {
        $vars:
            var1 => $vars [ "var1" ],
            var2 => $vars [ "var2" ],
    }
}
