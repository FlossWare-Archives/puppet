class yum::fedora {
    include yum::fedora::everything
    include yum::fedora::updates
    include yum::fedora::rpmfusion
}
