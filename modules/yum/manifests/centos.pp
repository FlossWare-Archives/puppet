class yum::centos {
    include yum::centos::addons
    include yum::centos::centosplus
    include yum::centos::contrib
    include yum::centos::extras
    include yum::centos::updates
    include yum::centos::epel
    include yum::centos::rpmforge
    include yum::centos::rpmfusion
}
