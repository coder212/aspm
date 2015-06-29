#!/bin/sh

check_package() {
  :
  # stub belum tau mau di isi apaan
}

# get_aspkg() pkg_name
# return value:
# 0 - Success
# 1 - Not found
# 2 - Multiple
get_aspkg() {
  local pkg_name tmp count name ver

  tmp=($( split_pkg_ver "${1}" ))
  name="${tmp[0]}"
  if [ -n "${tmp[1]}" ]; then
    ver="${tmp[1]}"
  fi
  count="$( pkg_count ${name} )"
  pkg_name="$( pkg_repo ${name} )"
  case ${count} in
    0)
      return 1
      ;;
    1)
      ;;
    *)
      echo "${pkg_name}"
      return 2
      ;;
  esac

  if [ -n "${ver}" ]; then
    pkg_name="${ASPKG_DIR}/${pkg_name}/aspkg-${ver}"
  else
    pkg_name="${ASPKG_DIR}/${pkg_name}/aspkg"
  fi

  echo "${pkg_name}"
  return 0
}

# get_src_file() aspkg
get_src_file() {
  :
}

build_package() {
  :
}

# vim: ft=sh:ts=4:sw=2:sts=2:syn=sh:et
