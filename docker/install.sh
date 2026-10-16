#!/bin/sh -eu

# Records the Julia this image holds, in the shape every image shares. The
# installed julia is asked, so the version is one the image can run rather
# than one written down when someone last edited this file.
# julia --version prints "julia version 1.12.7".
readonly LANGUAGE_VERSION=$(julia --version | cut -d' ' -f3)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from julia --version' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "Julia",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
