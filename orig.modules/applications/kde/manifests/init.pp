include defaults

class kde ($timeout = "${defaults::execTimeout}", $path="${default::path}") {
    include xwindows
    include xscreensaver
	include desktop

	desktop ($group = "kde-desktop", $unless = "startkde", $timeout = "${timeout}", $path = "${path}")
}