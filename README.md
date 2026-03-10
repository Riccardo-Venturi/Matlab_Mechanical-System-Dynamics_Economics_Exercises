# Matlab_simulations_
This is a repo of old matlab simulations and new ones i used to gain experience with real case studies
# 🚀 Applied System Dynamics & Engineering Economics
![MATLAB](https://img.shields.io/badge/MATLAB-Simulation-blue)
![Python](https://img.shields.io/badge/Python-Coming_Soon-yellow)
![Status](https://img.shields.io/badge/Status-Active_Development-success)

## 📌 Overview
This repository serves as a unified workspace for numerical simulations applied to **Mechanical Engineering** and **Industrial Economics**. 
The goal of this project is to model physical and economic systems mathematically, solve complex ODEs, and extract data-driven insights. 

The project is currently divided into two main domains, with plans to expand the mechanical simulations into the Python/SciPy ecosystem in the near future.

---

## 📂 1. Mechanical Vibrations & System Dynamics (ME 564 Style)
📍 **Folder:** `/Mechanical_Vibrations_Dynamics`

This section focuses on the numerical resolution of physical systems using State-Space representation and MATLAB ODE solvers (e.g., `ode45`).
* **Multi-DOF Systems:** State-space modeling of 2-DOF spring-mass-damper systems, including eigenvalue analysis (`eig(A)`) to compute natural frequencies.
* **Non-Linear Dynamics:** Advanced simulation of a non-linear pendulum, avoiding the small-angle approximation. Includes Live 2D Animations and computation of the exact period using the Complete Elliptic Integral of the First Kind and Taylor series expansions.
* **Forced Vibrations:** Models of damped oscillators subjected to harmonic excitation, with automated data-logging routines (.csv export) designed for future Machine Learning pipelines.

## 📂 2. Engineering Economics & Plant Management
📍 **Folder:** `/Industrial_Economics_Facilities`

A suite of tools developed to automate financial mathematics and investment appraisals for industrial plants.
* **Investment Evaluation:** Iterative solvers for Net Present Value (NPV/VAN) and Net Future Value (NFV) of industrial assets.
* **Cash Flow Automation:** Algorithms to convert continuous payments into equivalent Present/Future values, featuring automated Cash Flow Diagram plotting.
* **TIR / IRR Computation:** Custom linear interpolation algorithms optimized to find the exact Internal Rate of Return by zeroing the NPV.

---

## 🚀 Future Roadmap
- [ ] Porting the Mechanical Vibrations solvers from MATLAB to **Python** (using `numpy`, `scipy.integrate.solve_ivp`).
- [ ] Applying Machine Learning (Data-Driven Discovery of Dynamics) to the exported `.csv` physical data.
- [ ] Enhancing the 2D animations using `matplotlib.animation`.

## 👨‍💻 Author
**Riccardo Venturi**
*Mechanical Engineer | Aspiring Data Scientist & ML Engineer*
[Link al tuo LinkedIn]
