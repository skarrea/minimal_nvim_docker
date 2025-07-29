FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    neovim git curl unzip ripgrep \
    && pip install --no-cache-dir pynvim \
    && apt-get clean

# Optionally copy config into image (or mount later)
# COPY ./nvim /root/.config/nvim
RUN mkdir -p /root/.config/nvim
RUN git clone https://github.com/skarrea/minimal_nvim_docker.git /root/.config/nvim

WORKDIR /workspace

CMD ["/bin/bash"]