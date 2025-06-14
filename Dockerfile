FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# hadolint ignore=DL3008
RUN apt-get install --quiet && apt-get install git && \
    uv pip install --system streamlit && \
    git clone https://github.com/SirPersimmon/bgremover.git /tmp/bgremover && \
    mv /tmp/bgremover/src/bgremover . && \
    rm -rf /tmp/bgremover

EXPOSE 8501

ENTRYPOINT ["streamlit", "run"]

CMD ["/app/bgremover/bgremover.py"]