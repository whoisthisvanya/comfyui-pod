# ComfyUI pre-installed on the RunPod PyTorch image, so a rented pod skips the 1.5–5 min install at every start.
# Model weights are NOT in the image (downloaded per session); nothing secret is in it.
FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

ARG COMFY_REF=c5751c81abe131202eea9e4c66d000589013dd0b
ARG FRAME_INTERP_REF=26545cc2dd95bc3d27f056016300673bdeee78f5

LABEL org.opencontainers.image.source="https://github.com/whoisthisvanya/comfyui-pod" \
      org.opencontainers.image.description="ComfyUI + ComfyUI-Frame-Interpolation pre-installed on runpod/pytorch (CUDA 12.8, torch 2.8)" \
      org.opencontainers.image.licenses="MIT"

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /opt/ComfyUI \
 && cd /opt/ComfyUI && git checkout -q "$COMFY_REF" \
 && pip install --no-cache-dir -r requirements.txt

RUN cd /opt/ComfyUI/custom_nodes \
 && git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git \
 && cd ComfyUI-Frame-Interpolation && git checkout -q "$FRAME_INTERP_REF" \
 && pip install --no-cache-dir -r requirements-no-cupy.txt

RUN pip install --no-cache-dir "huggingface_hub[hf_transfer]" \
 && echo "comfy=$COMFY_REF frame_interp=$FRAME_INTERP_REF" > /opt/ComfyUI/IMAGE_VERSION
