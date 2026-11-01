#!/bin/bash
# Darlinx Local AI & Machine Learning Profile
# For data scientists running models locally (CPU/GPU)
# Requires: Base profile installed first + GPU detection

###############################################################################
# CUDA TOOLKIT (NVIDIA GPUs - Optional but recommended)
###############################################################################
cuda_packages=(
    "cuda"                       # NVIDIA CUDA toolkit
    "cudnn"                      # CuDNN deep learning library
    "nvidia-utils"               # NVIDIA driver utilities
    "nvidia-settings"            # GPU control panel
    
    # OpenCL for AMD/Intel fallback
    "ocl-icd"                    # OpenCL ICD loader
)

###############################################################################
# DEEP LEARNING FRAMEWORKS
###############################################################################
ml_frameworks=(
    "python-pytorch"             # PyTorch framework
    "tensorflow"                 # Google TensorFlow
    "keras"                      # High-level neural API
    "jax"                        # JAX (Google, for research)
)

###############################################################################
# DATA SCIENCE & NOTEBOOKS
###############################################################################
data_science_packages=(
    "jupyter-lab"                # Interactive notebooks
    "jupyter-notebook"           # Classic notebook interface
    "anaconda"                   # Python distribution (optional)
    "conda-forge-miniconda3"     # Lightweight conda
)

###############################################################################
# LOCAL LLM INFERENCE
###############################################################################
llm_packages=(
    "ollama"                     # Simple local LLM runner
    "llama-cpp"                  # GGML-based inference engine
    "llama.cpp"                  # CLI tool for running models
    "gpt4all"                    # Local LLM GUI application
    
    # Model repositories
    "huggingface-cli"            # HuggingFace CLI tools
)

###############################################################################
# COMPUTER VISION & IMAGE AI
###############################################################################
cv_packages=(
    "opencv"                     # OpenCV library
    "stable-diffusion-webui"     # Stable Diffusion GUI
    "comfyui"                    # Node-based SD UI (alternative)
    
    # Image processing libraries
    "pillow"                     # Python imaging library
    "imageio"                    # Multi-format image reader/writer
)

###############################################################################
# NLP & TEXT PROCESSING
###############################################################################
nlp_packages=(
    "natural-language-toolkit"   # NLTK library
    "spacy"                      # Industrial-strength NLP
    "transformers"               # HuggingFace Transformers
)

###############################################################################
# GPU UTILITIES & MONITORING
###############################################################################
gpu_utils=(
    "nvtop"                      # htop for NVIDIA GPUs
    "gpustat"                    # Python GPU status tool
    "pynvml"                     # NVIDIA Management Library (Python)
)

###############################################################################
# DATA VISUALIZATION
###############################################################################
viz_packages=(
    "matplotlib"                 # Python plotting library
    "seaborn"                    # Statistical visualization
    "plotly"                     # Interactive visualizations
    "bokeh"                      # Interactive dashboards
)

# Export all arrays for Calamares integration
export -f install_ai_profile
export cuda_packages ml_frameworks data_science_packages llm_packages \
       cv_packages nlp_packages gpu_utils viz_packages