# split_pkg_ver() pkg:ver|pkg-ver
# split package name input to package_name [version (if any)]
split_pkg_ver() {
  echo "${1}" | sed -r 's/[-:]/ /' 2> /dev/null
}

# pkg_count() pkg_name
# print how many package occurred in the repository
pkg_count() {
  grep -c -E '\<'$1'$' "${PKG_LIST}" 2> /dev/null
}

# pkg_repo() pkg_name
# get repo/pkg based on input
pkg_repo() {
  grep -E '\<'${1}'$' "${PKG_LIST}" 2> /dev/null
}
# vim: ft=sh:ts=4:sw=2:sts=2:syn=sh:et
