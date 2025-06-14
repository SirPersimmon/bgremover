FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# hadolint ignore=DL3008
RUN apt-get update --quiet && apt-get install -y --no-install-recommends git && \
    uv pip install --system numba==0.61.2 onnxruntime==1.22.0 rembg==2.0.66 streamlit && \
    git clone https://github.com/SirPersimmon/bgremover.git /tmp/bgremover && \
    mv /tmp/bgremover/src/bgremover . && \
    rm -rf /tmp/bgremover

EXPOSE 8501

ENTRYPOINT ["streamlit", "run"]

CMD ["/app/bgremover/bgremover.py"]