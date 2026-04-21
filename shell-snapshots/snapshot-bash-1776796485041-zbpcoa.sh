# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
shopt -s expand_aliases
# Check for rg availability
if ! (unalias rg 2>/dev/null; command -v rg) >/dev/null 2>&1; then
  function rg {
  local _cc_bin="${CLAUDE_CODE_EXECPATH:-}"
  [[ -x $_cc_bin ]] || _cc_bin=$(command -v claude 2>/dev/null)
  if [[ ! -x $_cc_bin ]]; then command rg "$@"; return; fi
  if [[ -n $ZSH_VERSION ]]; then
    ARGV0=rg "$_cc_bin" "$@"
  elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
    ARGV0=rg "$_cc_bin" "$@"
  elif [[ $BASHPID != $$ ]]; then
    exec -a rg "$_cc_bin" "$@"
  else
    (exec -a rg "$_cc_bin" "$@")
  fi
}
fi
export PATH='/c/Users/user/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/user/bin:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/PROGRA~1/PTC/UTILIT~1/MKSTOO~1/bin64:/c/PROGRA~1/PTC/UTILIT~1/MKSTOO~1/bin:/c/PROGRA~1/PTC/UTILIT~1/MKSTOO~1/bin/X11:/c/PROGRA~1/PTC/UTILIT~1/MKSTOO~1/mksnt:/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files (x86)/Windows Kits/8.1/Windows Performance Toolkit:/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn:/c/Program Files (x86)/Microsoft SQL Server/150/Tools/Binn:/c/Program Files/Microsoft SQL Server/150/Tools/Binn:/c/Program Files/Microsoft SQL Server/150/DTS/Binn:/c/Program Files/dotnet:/cmd:/c/Program Files/nodejs:/c/Users/user/AppData/Local/Programs/Python/Python39/Scripts:/c/Users/user/AppData/Local/Programs/Python/Python39:/c/Users/user/AppData/Local/Microsoft/WindowsApps:/c/Users/user/AppData/Roaming/npm:/usr/bin/vendor_perl:/usr/bin/core_perl'
