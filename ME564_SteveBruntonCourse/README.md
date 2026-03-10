# ⚙️ Mechanical Vibrations & Dynamics - MATLAB Simulations

## 📝 Overview
This repository contains a collection of MATLAB scripts developed to simulate and analyze the dynamic behavior of mechanical systems. The core focus is on solving Ordinary Differential Equations (ODEs) using numerical methods (e.g., `ode45`) via **State-Space Representation**. 

The implemented models range from basic damped oscillators to multi-degree-of-freedom (MDOF) systems and non-linear pendulum kinematics, featuring both data export capabilities and real-time visual animations.

## 📂 Repository Contents

### 1. `esercizio2Masse2Molle_fattoDaMe.m` (2-DOF Spring-Mass System)
A simulation of a 2-Degree-of-Freedom mechanical system (two masses, two springs).
* **Key Features:** Formulates the fourth-order differential equation into a state-space matrix `A`.
* Computes the system's eigenvalues `eig(A)` to find the natural frequencies.
* Solves the initial value problem (given initial velocity, acceleration, and jerk) and plots the displacement over time.

### 2. `Esercizio_4_Ode_45_lezione_4_moto_armonico_conJerk.m` (Damped Harmonic Oscillator)
A numerical solver for a single-mass spring-damper system.
* **Key Features:** Implements viscous damping coefficients simulating different environments (e.g., steel-on-steel friction, air resistance).
* Tracks and plots both Position and Velocity arrays over the simulation time step.

### 3. `Lezion4_con_smorzato_forzzato_forzeArmoiche.m` (Forced & Damped Vibrations)
Extends the previous damped oscillator model by introducing an external **harmonic forcing function** $F_0 \cos(\omega_f t)$.
* **Key Features:** Perfect for studying resonance and "beating" phenomena.
* Features a data logging section that automatically exports the arrays $(t, x, v)$ into a `.csv` file for further analysis or machine learning integration in Python.

### 4. `Pendulum_ODE_matlab_2_ways_integr_differential.m` (Non-Linear Pendulum)
A comprehensive script analyzing the exact non-linear equation of a simple pendulum ($\ddot{\theta} + \frac{g}{l}\sin(\theta) = 0$) without the small-angle approximation.
* **Key Features:** Computes the exact physical period using the **Complete Elliptic Integral of the First Kind** (`ellipticK`) and Taylor Series expansion.
* Features a **live 2D mathematical animation** using `drawnow` to visually simulate the swinging rod and mass.

---

## 🛠 Prerequisites & Usage
* **Environment:** MATLAB R2019a or newer (Requires the Symbolic Math Toolbox for the Taylor series evaluation in the Pendulum script).
* **How to run:**
  1. Clone the repository and set the folder as your *Current Directory* in MATLAB.
  2. Run any `.m` script.
  3. The scripts are highly interactive: follow the prompts in the **Command Window** to input physical parameters (mass, initial position, forces, rod length).

*(Project developed for Mechanical Engineering studies - Dynamics and Vibrations)*
