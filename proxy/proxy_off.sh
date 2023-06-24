# 关闭系统代理
function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset no_proxy
    echo -e "\033[31m[×] 已关闭代理\033[0m"
}
proxy_off
