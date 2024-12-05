Overview
This repository contains MATLAB code for an image encryption scheme based on the Sine Modulo Chaotic Map, utilizing a permutation combination approach for secure encryption. The repository also includes various analysis functions for evaluating the chaotic map and the encryption scheme, such as:

Entropy
Approximate Entropy
Lyapunov Exponent
Bifurcation Analysis
Image Encryption and Evaluation
The encryption process involves a chaotic map for pixel permutation and diffusion using XOR operations. The encryption scheme is evaluated using the following metrics:

UACI (Unified Average Changing Intensity)
NPCR (Number of Pixel Change Rate)
HVD (Histogram Variance Difference) Correlation
Noise Resilience: Includes testing under Gaussian Noise and Salt-and-Pepper Noise.
Data Loss Attack and Key Sensitivity analysis to assess robustness.
Chaotic Sequence to Binary Data
The chaotic sequence generated from the map is converted into binary data, which is then used for NIST SP800-22 testing to evaluate the randomness of the sequence.

