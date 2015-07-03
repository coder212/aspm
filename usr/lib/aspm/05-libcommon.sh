# is_in() val array
# check if val is in array
is_in() {
  local expected
  expected="${1}"
  shift

  local val
  for val in "${@}"; do
    if [ "${expected}" = "${val}" ]; then
      return 0
    fi
  done
  return 1
}

# is_installed() pkg_name
# check if the package has already been installed
is_installed() {
  grep -E "${1}" "${PKG_INSTALLED}" 2> /dev/null
  if [ ${?} -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

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
