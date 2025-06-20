# 🧫 HGMBiome Project

**Simulation-based analysis of gut microbial communities using constraint-based metabolic models.**
This repository contains the full pipeline, datasets, scripts, and results used to explore community-level metabolic modeling of gut microbiota.

---

## 📁 Repository Structure

```
├── analysis/               # Scripts and notebooks for analyzing simulation outputs (FBA, t-SNE, clustering, etc.)
├── article/                # LaTeX source and exported PDFs of the project article
├── comm_results/           # Results from community-level simulations (SMETANA, MICOM, SteadyCom)
├── comm_sim_scripts/       # Scripts used to run community-level simulations
├── datasets/               # Input datasets (GutFeelingKB, BiGG info) and preprocessing scripts
├── models/                 # Genome-scale metabolic models (GEMs) used in simulations
├── solo_sim_results/       # Results from individual model simulations (e.g., FBA, minimal media)
├── solo_sim_scripts/       # Scripts for running simulations on individual GEMs
├── LICENSE                 # License file
├── README.md               # Project documentation
└── slides_presentation.pdf # Final presentation slides (PDF)
```

---

## 🧪 Project Overview

This project tests a pipeline for simulating and analyzing gut microbial communities using multiple metabolic modeling tools.
Key tools include:

* **COBRApy** – for individual GEM validation and minimal medium construction
* **SMETANA** – for predicting metabolic dependencies
* **MICOM** – for abundance-informed community simulations
* **SteadyCom** – for stable community composition estimation

---

## 📌 Goals

* Integrate and validate community simulation tools
* Build a reproducible and extensible modeling pipeline
* Test analytical strategies (dimensionality reduction, clustering)
* Explore the feasibility of characterizing microbial ecotypes via simulation

---

## 🛠 Requirements

Python 3.10+ with packages:

* `cobra`
* `micom`
* `reframed`
* `pandas`, `numpy`, `matplotlib`, `scikit-learn`

Solver/Simulation Engine Cplex recommended

✅ **Maintained by:** Artur Gomes (arog-bioinfo)
