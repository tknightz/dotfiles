set TOSHIBA_PROXY "http://proxy.toshiba.co.jp:8080"
set TSDV_PROXY "http://localhost:3128"

set -gx http_proxy $TOSHIBA_PROXY
set -gx HTTP_PROXY $TOSHIBA_PROXY
set -gx HTTPS_PROXY $TOSHIBA_PROXY
set -gx https_proxy $TOSHIBA_PROXY
set -gx proxy $TOSHIBA_PROXY

# helper functions
function turnoffproxy
  set -e http_proxy
  set -e https_proxy
  set -e HTTP_PROXY
  set -e HTTPS_PROXY
end

function turnonproxy
  set -gx http_proxy $TSDV_PROXY
  set -gx HTTP_PROXY $TSDV_PROXY
  set -gx https_proxy $TSDV_PROXY
  set -gx HTTPS_PROXY $TSDV_PROXY
end

function switchproxy
  if test "$argv" = "toshiba"
    set -gx http_proxy $TOSHIBA_PROXY
    set -gx HTTP_PROXY $TOSHIBA_PROXY
    set -gx HTTPS_PROXY $TOSHIBA_PROXY
    set -gx https_proxy $TOSHIBA_PROXY
    set -gx proxy $TOSHIBA_PROXY
  else if test "$argv" = "tsdv"
    set -gx http_proxy $TSDV_PROXY
    set -gx HTTP_PROXY $TSDV_PROXY
    set -gx HTTPS_PROXY $TSDV_PROXY
    set -gx https_proxy $TSDV_PROXY
    set -gx proxy $TSDV_PROXY
  end
end
