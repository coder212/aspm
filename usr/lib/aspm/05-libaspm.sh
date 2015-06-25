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
  local pkg_name tmp count

  tmp=($( split_pkg_ver "${1}" ))
  pkg_name="$( pkg_repo ${tmp[0]} ${PKGLIST} )"
  count="$( echo ${pkg_name} | wc -w )"
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

  if [ -n "${tmp[1]}" ]; then
    pkg_name="${ASPKG_DIR}/${pkg_name}/aspkg-${tmp[1]}"
  else
    pkg_name="${ASPKG_DIR}/${pkg_name}/aspkg"
  fi

  echo "${pkg_name}"
  return 0
}

split_pkg_ver() {
  echo "${1}" | sed -r 's/[-:]/ /'
}

pkg_repo() {
  grep -E '\<'${1}'$' "${2}"
}
# vim: ft=sh:ts=4:sw=2:sts=2:syn=sh:et
