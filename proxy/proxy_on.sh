# 开启系统代理
function proxy_on() {
    export http_proxy=http://127.0.0.1:7890
    export https_proxy=http://127.0.0.1:7890
    export no_proxy=127.0.0.1,localhost
    echo -e "\033[32m[√] 已开启代理\033[0m"
}
proxy_on