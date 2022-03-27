---
author: Fan Cheng, Rob&nbsp;J&nbsp;Hyndman, Anastasios&nbsp;Panagiotelis
date: 2021-02-15
slug: mlann
title: "Computationally Efficient Learning of Statistical Manifolds"
kind: unpublished
tags:
- data science
- anomaly detection
- manifold learning
link: https://github.com/ffancheng/paper-mlann/raw/public/paper/arxiv.pdf
github: ffancheng/paper-mlann
---

Analyzing high-dimensional data with manifold learning algorithms often requires searching for the nearest neighbors of all observations. This presents a computational bottleneck in statistical manifold learning when observations of probability distributions rather than vector-valued variables are available or when data size is large. We resolve this problem by proposing a new method for approximation in statistical manifold learning. The novelty of our approximation is the strongly consistent distance estimators based on independent and identically distributed samples from probability distributions. By exploiting the connection between Hellinger/total variation distance for discrete distributions and the L2/L1 norm, we demonstrate that the proposed distance estimators, combined with approximate nearest neighbor searching, could largely improve the computational efficiency with little to no loss in the accuracy of manifold embedding. The result is robust to different manifold learning algorithms and different approximate nearest neighbor algorithms. The proposed method is applied to learning statistical manifolds of electricity usage. This application demonstrates how underlying structures in high dimensional data, including anomalies, can be visualized and identified, in a way that is scalable to large datasets.
