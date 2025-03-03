# SimpleTM
The repo is the official implementation for the paper: [[ICLR '25] SimpleTM: A Simple Baseline For Multivariate Time Series Forcasting](https://openreview.net/pdf?id=oANkBaVci5).


# Introduction
We propose SimpleTM, a simple yet effective architecture that uniquely integrates classical signal processing ideas with a slightly modified attention mechanism. 

<p align="center">
<img src="./figures/Framework.png"  alt="" align=center />
</p>

We show that even a single-layer configuration can effectively capture intricate dependencies in multivariate time-series data, while maintaining minimal model complexity and parameter requirements. This streamlined construction achieves a performance profile surpassing (or on par with) most existing baselines across nearly all publicly available benchmarks.

<p align="center">
<img src="./figures/Long_term_forecast_results.jpg"  alt="" align=center />
</p>

# Get Started

## 1. Download the Data

All datasets have been preprocessed and are ready for use. You can obtain them from their original sources:

- **ETT**: [https://github.com/zhouhaoyi/ETDataset/tree/main](https://github.com/zhouhaoyi/ETDataset/tree/main)
- **Traffic, Electricity, Weather**: [https://github.com/thuml/Autoformer](https://github.com/thuml/Autoformer?tab=readme-ov-file)
- **Solar**: [https://github.com/laiguokun/LSTNet](https://github.com/laiguokun/LSTNet)
- **PEMS**: [https://github.com/cure-lab/SCINet](https://github.com/cure-lab/SCINet?tab=readme-ov-file)

For convenience, we provide a comprehensive package containing all required datasets, available for download from [Google Drive](https://drive.google.com/file/d/1hTpUrhe1yEIGa9mCiGxM5rDyzlYKAnyx/view?usp=sharing). You can place it under the folder [./dataset](./dataset/).

## 2. Setup Your Environment

Choose one of the following methods to set up your environment:

### Option A: Anaconda
Create and activate a Python environment using the provided configuration file [environment.yml](./environment.yml):

```bash
conda env create -f environment.yml -n SimpleTM
conda activate SimpleTM
```

### Option B: Docker
If you prefer Docker, build an image using the provided [Dockerfile](./Dockerfile):

```bash
docker build --tag simpletm:latest .
```


## 3. Train the Model

Experiment scripts for various benchmarks are provided in the [`scripts`](./scripts) directory. You can reproduce experiment results as follows:

```bash
bash ./scripts/multivariate_forecasting/ETT/SimpleTM_h1.sh       # ETTh1
bash ./scripts/multivariate_forecasting/ECL/SimpleTM.sh          # Electricity
bash ./scripts/long_term_forecast/SolarEnergy/SimpleTM.sh        # Solar-Energy
bash ./scripts/long_term_forecast/Weather/SimpleTM.sh            # Weather
bash ./scripts/short_term_forecast/PEMS/SimpleTM_03.sh           # PEMS03
```

### Docker Users
If you're using Docker, run the scripts with the following command structure (example for ETTh1):

```bash
docker run --gpus all -it --rm --ipc=host \
    --user $(id -u):$(id -g) \
    -v "$(pwd)":/scratch --workdir /scratch -e HOME=/scratch \
    simpletm:latest \
    bash scripts/multivariate_forecasting/ETT/SimpleTM_h1.sh
```


# Model Efficiency
To provide an efficiency comparison, we evaluated our model against two of the most competitive baselines: the transformer-based iTransformer and linear-based TimeMixer. Our experimental setup used a consistent batch size of 256 across all models and measured four key metrics: total trainable parameters, inference time, GPU memory footprint, and peak memory usage during the backward pass. Results for all baseline models were compiled using PyTorch. 

Please note that our default experimental configuration does not employ compilation optimizations. To speed up, enable the --compile flag in the scripts.

<p align="center">
<img src="./figures/Efficiency.jpg"  alt="" align=center />
</p>


# Acknowledgement

We appreciate the following GitHub repos a lot for their valuable code and efforts.
- Time-Series-Library (https://github.com/thuml/Time-Series-Library)
- iTransformer (https://github.com/thuml/iTransformer)
- TimeMixer (https://github.com/kwuking/TimeMixer)
- Autoformer (https://github.com/thuml/Autoformer)


# Citation
If you find this repo helpful, please cite our paper. 

```bibtex
@inproceedings{
chen2025a,
title={A Simple Baseline for Multivariate Time Series Forecasting},
author={Hui Chen and Viet Luong and Lopamudra Mukherjee and Vikas Singh},
booktitle={The Thirteenth International Conference on Learning Representations},
year={2025},
url={https://openreview.net/forum?id=oANkBaVci5}
}
```