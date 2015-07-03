#!/bin/sh

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

# get_build_deps() $pkg_bdeps[@]
# return build dependency
get_build_deps() {
  local bdeps
  if [ -n "${pkg_bdeps}" ]; then
    local dep
    for dep in "${pkg_bdeps[@]}"; do
      bdeps+=" ${dep}"
    done
  fi
  printf "%s\n" "${bdeps# }"
}

# get_runtime_deps() $pkg_rdeps[@]
# return runtime dependency
get_runtime_deps() {
  local rdeps
  if [ -n "${pkg_rdeps}" ]; then
    local dep
    for dep in "${pkg_rdeps[@]}"; do
      if [[ "${dep}" == *::* ]]; then
        is_in "${dep%::*}" "${ASPKG_CONFIG_OPTIONS[@]}"
        if [ ${?} -eq 0 ]; then
          rdeps+=" ${dep#*::}"
        else
          continue
        fi
      else
        rdeps+=" ${dep}"
      fi
    done
  fi
  printf "%s\n" "${rdeps# }"
}

# get_src_file() aspkg
get_src_file() {
  :
}

build_package() {
  :
}

# vim: ft=sh:ts=4:sw=2:sts=2:syn=sh:et
