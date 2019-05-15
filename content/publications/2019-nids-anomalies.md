---
author: Insha Ullah, Kerrie&nbsp;Mengersen, Rob&nbsp;J&nbsp;Hyndman, James&nbsp;McGree
date: 2019-03-09
slug: nids-anomalies
title: Detection of cybersecurity attacks through analysis of web browsing activities using principal component analysis
kind: unpublished
tags:
- data science
- time series
- anomaly detection
link: /papers/bare_adv.pdf
---

Organizations such as government departments and financial institutions provide online service facilities accessible via an increasing number of internet connected devices which make their operational environment vulnerable to cyber attacks. Consequently, there is a need to have mechanisms in place to detect cyber security attacks in a timely manner. A variety of Network Intrusion Detection Systems (NIDS) have been proposed and can be categorized into signature-based NIDS and anomaly-based NIDS. The signature-based NIDS, which identify the misuse through scanning the activity signature against the list of known attack activities, are criticized for their inability to identify new attacks (never-before-seen attacks). Among anomaly-based NIDS, which declare a connection anomalous if it expresses deviation from a trained model, the unsupervised learning algorithms circumvent this issue since they have the ability to identify new attacks. In this study, we use an unsupervised learning algorithm based on principal component analysis to detect cyber attacks. In the training phase, our approach has the advantage of also identifying outliers in the training dataset. In the monitoring phase, our approach first identifies the affected dimensions and then calculates an anomaly score by aggregating across only those components that are affected by the anomalies. We explore the performance of the algorithm via simulations and through two applications, namely to the UNSW-NB15 dataset recently released by the Australian Centre for Cyber Security and to the well-known KDD’99 dataset. The algorithm is scalable to large datasets in both training and monitoring phases, and the results from both the simulated and real datasets show that the method has promise in detecting suspicious network activities.

