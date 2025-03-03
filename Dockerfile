FROM nvcr.io/nvidia/pytorch:22.10-py3

ENV PYTHONPATH=/workspace
ENV PYTHONUNBUFFERED=1

RUN pip install --no-cache-dir \
    einops==0.8.1 \
    matplotlib==3.7.0 \
    numpy==1.23.5 \
    scikit-learn==1.2.2 \
    scipy==1.10.1 \    
    pandas==1.5.3 \
    reformer-pytorch==1.4.4 \
    PyWavelets
