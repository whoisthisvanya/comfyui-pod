# comfyui-pod

ComfyUI and ComfyUI-Frame-Interpolation pre-installed (pinned commits) on `runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404`,
so a rented GPU pod does not install them at every start. No model weights and no credentials are in the image.

Image: `ghcr.io/whoisthisvanya/comfyui-pod:latest` (also tagged `comfy-<commit>`). Built by GitHub Actions on every change
to the Dockerfile. ComfyUI lives in `/opt/ComfyUI`.
