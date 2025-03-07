## https://github.com/prefix-dev/pixi/issues/1410
rm pixi.toml
pixi init --import environment.yaml

# pixi shell

## search "gradio error before function returns"
## Error if output takes more than 5 seconds to generate
## https://github.com/gradio-app/gradio/issues/3078
## https://github.com/gradio-app/gradio/issues/5143
sh fix_timeout_bug.sh

## or just upgrade gradio
## https://github.com/Yujun-Shi/DragDiffusion/issues/77