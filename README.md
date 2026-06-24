#  World Cities Wave Visualization

A generative geospatial visualization that transforms global city data into an animated system of temporal emergence and wave propagation.

Cities are revealed over time by country, with population-driven hierarchy and procedural wave effects originating from major urban centers.

The result is a cinematic representation of global urban structure as a dynamic, evolving system.

---

#  Features

##  Temporal Country-Based Animation

* Countries are revealed sequentially over time
* Cities appear progressively within each active country
* Global dataset unfolds as a time-driven system

##  Population-Based City Encoding

* City size scales with population
* Logarithmic scaling ensures visual balance
* Higher population = stronger visual presence

##  Hierarchical Urban Structure

* Each country identifies a **leader city** (highest population)
* Leader cities act as visual and temporal anchors
* Capital cities are highlighted with animated labels

##  Procedural Wave System

* Leader cities emit expanding ripple waves
* Waves use noise-based distortion for organic motion
* Energy decays over time and distance
* Soft edge fading creates natural dissipation

##  Cinematic Time System

* Frame-based global time progression
* Controlled pacing of country activation
* Smooth emergence and fade transitions
* Designed for visual storytelling rather than static display

---

#  Dataset

This project uses the **World Cities Database** from SimpleMaps:

https://simplemaps.com/data/world-cities

### Dataset includes:

* City name
* Country
* Latitude / Longitude
* Population estimates
* Capital classification

---

#  How It Works

## 1. Data Loading

World cities dataset is parsed and grouped by country.

## 2. Hierarchy Construction

For each country:

* Cities are indexed
* Largest population city is selected as leader
* Capitals are flagged for labeling

## 3. Temporal Scheduling

A global time variable controls:

* Country activation timing
* City appearance sequencing
* Label animation windows
* Wave propagation cycles

## 4. Rendering Pipeline

Each frame:

* Cities are filtered by activation time
* Positions are projected (lat/lng → screen space)
* Visual properties are computed dynamically
* Wave system updates and renders expanding ripples

---

#  Key Concepts

* Geospatial data visualization
* Temporal animation systems
* Hierarchical data modeling
* Procedural motion graphics
* Noise-based distortion (Perlin noise)
* Data-driven generative art
* Emergent visual systems

---

#  Project Structure

```bash id="structure1"
world-cities-visualization/
│
├── world_cities.pde        # Main Processing sketch
├── data/
│   └── worldcities.csv     # Dataset
├── exports/
│   └── preview.gif         # Optional output
└── README.md
```

---

#  How to Run

1. Install **Processing**
   https://processing.org/

2. Clone the repository:

```bash id="setup1"
git clone https://github.com/your-username/world-cities-visualization.git
```

3. Open:

```
world_cities.pde
```

4. Place dataset in:

```
data/worldcities.csv
```

5. Click **Run ▶**

---

#  Visual Philosophy

This project explores cities not as static coordinates, but as:

> **signals in a global dynamic system**

Where:

* Population defines visual strength
* Geography defines structure
* Time defines emergence
* Waves represent influence propagation

---

#  Design Principles

* Data-driven animation over static rendering
* Temporal storytelling over instant display
* Emergent visual behavior from simple rules
* Hierarchical encoding of global systems
* Continuous motion as a primary interface

---

#  Future Improvements

* Interactive zoomable world map (real projection)
* GPU-accelerated rendering (WebGL / shaders)
* Real-time dataset streaming
* Continent-based clustering system
* User-controlled simulation parameters
* Transition to 3D globe visualization

---

#  What This Project Demonstrates

This project demonstrates:

* generative systems design
* procedural animation engineering
* geospatial visualization techniques
* temporal data orchestration
* emergent motion design systems

---

#  Summary

This is not a static visualization.

It is a:

> **time-evolving geospatial simulation of global urban structure**

---

#  Big Picture

This project sits at the intersection of:

* data visualization
* generative art
* simulation systems
* geospatial computing
