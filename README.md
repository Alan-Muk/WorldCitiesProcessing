  World Cities Wave Visualization

---

  Overview

This project visualizes cities around the world using latitude and longitude data. Cities appear gradually by country, with larger cities acting as “leaders” that emit expanding wave signals. Capital cities are highlighted with animated labels that fade in and out over time.

The result is a slow, atmospheric representation of global urban structure and influence.

---

  Features

*  Country-by-country animated reveal
*  City population-based visualization
*  Largest city per country acts as a “leader”
*  Expanding wave propagation from leader cities
*  Capital city labeling with fade-in/out animation
*  Natural wave dissipation (energy decay over time & distance)
*  Cinematic time-based pacing system

---

 Dataset

This project uses the **World Cities Database** from SimpleMaps:

https://simplemaps.com/data/world-cities

Includes:

* City names
* Latitude & longitude
* Country
* Population estimates
* Capital classification

---

 How to Run

1. Install [Processing](https://processing.org/)
2. Clone or download this repository
3. Open `world_cities.pde` in Processing
4. Place `worldcities.csv` inside the `data/` folder
5. Press **Run**

---

 Key Concepts

* Data-driven generative art
* Geographic projection (lat/lng → screen space)
* Temporal sequencing and animation timing
* Noise-based procedural distortion
* Visual encoding of population hierarchy
* Emergent motion through wave simulation

---

Project Structure

```
world-cities-visualization/
│
├── world_cities.pde
├── data/
│   └── worldcities.csv
├── exports/
│   └── preview.gif (optional)
└── README.md
```

---

Inspiration

This project explores how geographic data can be transformed into a living system of motion, where cities behave like signals in a global network rather than static points on a map.


---

##Author

Created as a generative data visualization / creative coding project using Processing.
