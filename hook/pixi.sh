if [ -z $PIXI_IN_SHELL ]; then
    echo "正在进入 Pixi 环境"
    if command -v pixi >/dev/null 2>&1; then
        eval "$(pixi shell-hook)"
    else
        echo "Pixi 未找到"
    fi
fi