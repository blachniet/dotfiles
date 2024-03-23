function mkcd --wraps=mkdir --description 'mkdir -p <path> && pushd <path>'
  if test (count $argv) -eq 1
    mkdir -p $argv[1] && pushd $argv[1]
  else
    printf 'error: expected 1 arg, but there was %i' (count $argv) >&2
    return 1
  end
end
