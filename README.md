# World Cities Wave Visualization

![Processing](https://img.shields.io/badge/Processing-4.x-006699)
![Data Visualization](https://img.shields.io/badge/Data-Visualization-blue)
![Geospatial](https://img.shields.io/badge/Domain-Geospatial-green)
![Generative Art](https://img.shields.io/badge/Style-Generative_Art-purple)
![License](https://img.shields.io/badge/License-MIT-green)

A generative geospatial visualization system that transforms global city data into an animated simulation of urban emergence, hierarchy, and influence propagation.

The project combines geospatial processing, procedural animation, temporal systems, and data-driven rendering to represent cities as dynamic signals within a global system.

---

# Overview

World Cities Wave Visualization converts a global cities dataset into a time-based visual simulation.

The system:

- Loads global city data
- Builds geographic and population hierarchies
- Schedules city emergence over time
- Generates procedural wave effects
- Renders an evolving representation of urban structure

The workflow:

```text
World Cities Dataset
          |
          ↓
Data Processing
          |
          ↓
Country + City Hierarchy
          |
          ↓
Temporal Scheduling System
          |
          ↓
Procedural Wave Engine
          |
          ↓
Processing Rendering Pipeline
```

---

# Problem

Geospatial datasets are often represented as static maps.

This project explores a different approach:

> How can geographic data be transformed into a dynamic system where patterns, hierarchy, and relationships emerge over time?

Instead of displaying cities as fixed points, the visualization treats them as evolving signals influenced by:

- Population
- Geography
- Time
- Urban hierarchy

---

# Architecture

## System Architecture

```text
                 City Dataset

                      |
                      ↓

              Data Loading Layer

                      |
                      ↓

          Geographic Processing Layer

                      |
                      ↓

          Temporal Animation Engine

                      |
                      ↓

          Procedural Wave Generator

                      |
                      ↓

             Processing Renderer
```

---

# Components

## Data Processing Layer

Responsibilities:

- Parse city dataset
- Group cities by country
- Extract population information
- Identify capital cities
- Determine country leader cities

Each city contains:

- Name
- Country
- Latitude
- Longitude
- Population
- Capital status

---

## Hierarchy System

The visualization builds a hierarchical model of global cities.

For each country:

- The highest population city becomes the leader city
- Capital cities receive special visual treatment
- Smaller cities inherit country activation timing

This creates a structured representation of global urban systems.

---

## Temporal Animation Engine

A global time system controls:

- Country activation order
- City appearance timing
- Label visibility
- Wave propagation cycles
- Transition effects

The animation is frame-driven and designed for continuous evolution.

---

## Procedural Wave System

Major cities generate expanding wave effects.

Wave behavior includes:

- Radius expansion
- Distance-based fading
- Energy decay
- Perlin-noise distortion
- Organic movement patterns

The result is a procedural representation of influence spreading through geographic space.

---

# Core Features

## Temporal Country-Based Emergence

- Countries activate sequentially
- Cities appear progressively
- The dataset unfolds as a time-based story

---

## Population-Based Visual Encoding

City importance is represented through population.

Features:

- Population controls visual size
- Logarithmic scaling maintains balance
- Larger cities create stronger visual presence

---

## Urban Hierarchy Visualization

The system highlights:

- Leader cities
- Capital cities
- Population differences
- Geographic relationships

---

## Generative Wave Propagation

Leader cities emit animated waves representing:

- Urban influence
- Connectivity
- Emergence
- Expansion

---

# Technical Highlights

- Built a data-driven generative visualization system
- Implemented geographic coordinate transformation
- Designed temporal scheduling algorithms
- Created procedural animation systems
- Applied hierarchical data modeling
- Used noise-based motion generation
- Combined static datasets with dynamic rendering

---

# Design Decisions

## Data-Driven Animation

Instead of manually creating animations, every visual element is generated from data.

Examples:

```
Population → Visual Size

Country → Activation Timing

Coordinates → Position

City Rank → Visual Importance
```

---

## Hierarchical Representation

A flat list of cities does not communicate global structure.

The system introduces hierarchy:

```
World
 |
Country
 |
Cities
 |
Leader City
```

This allows large datasets to become visually understandable.

---

## Procedural Motion

Wave effects are generated algorithmically instead of using predefined animations.

Benefits:

- Infinite variation
- Smooth transitions
- Data-driven behavior
- Emergent visual patterns

---

# Dataset

Source:

World Cities Database by SimpleMaps

https://simplemaps.com/data/world-cities

Dataset includes:

- City name
- Country
- Latitude
- Longitude
- Population estimates
- Capital classification

---

# Project Structure

```text
world-cities-visualization/

├── world_cities.pde
├── data/
│   └── worldcities.csv
│
├── exports/
│   └── preview.gif
│
└── README.md
```

---

# How It Works

## 1. Load Dataset

The application reads the global cities dataset and converts records into internal city objects.

---

## 2. Build Geographic Hierarchy

Cities are grouped by country.

For each country:

- Cities are indexed
- Population rankings are calculated
- Leader cities are selected
- Capitals are identified

---

## 3. Schedule Animation

A global clock determines:

- When countries appear
- When cities emerge
- When labels activate
- When waves propagate

---

## 4. Render Simulation

Every frame:

1. Active cities are calculated
2. Coordinates are projected into screen space
3. Visual properties are computed
4. Waves are updated
5. The scene is rendered

---

# Visual Philosophy

This project represents cities as:

> signals in a global dynamic system

Where:

- Population defines intensity
- Geography defines structure
- Time defines emergence
- Waves represent influence propagation

---

# Example Applications

- Geospatial storytelling
- Urban data visualization
- Generative art systems
- Simulation interfaces
- Educational visualization tools

---

# Challenges

## Large Dataset Visualization

Thousands of geographic points can become visually overwhelming.

Solutions:

- Hierarchical rendering
- Population-based scaling
- Progressive activation

---

## Creating Meaningful Motion

Random animation does not communicate information.

Solutions:

- Data-driven timing
- Procedural wave behavior
- Hierarchical emergence rules

---

## Geographic Representation

Latitude and longitude coordinates require transformation into visual space.

Solution:

- Coordinate projection system
- Dynamic positioning calculations

---

# Future Improvements

- Interactive zoomable world map
- WebGL GPU acceleration
- Shader-based rendering
- Real-time dataset streaming
- Continent-level clustering
- 3D globe visualization
- User-controlled simulation parameters

---

# What This Project Demonstrates

This project demonstrates:

- Generative systems engineering
- Procedural animation
- Geospatial visualization
- Temporal data processing
- Simulation design
- Data-driven rendering

---

# Summary

World Cities Wave Visualization is not a static map.

It is a:

> time-evolving simulation of global urban structure generated from real-world data.

The project explores the intersection of:

- Data visualization
- Simulation systems
- Geospatial computing
- Generative design
