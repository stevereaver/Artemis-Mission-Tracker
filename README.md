# Artemis II Mission Tracker

A high-fidelity, real-time mission dashboard for the **Artemis II** crewed lunar flyby mission. This dashboard provides a comprehensive view of the mission's trajectory, crew routines, and spacecraft operations, synchronized with the official mission clock.

## 🚀 Features

- **Real-Time Simulation**: Synchronized with the actual mission clock (anchored to April 1, 2026, 22:35 UTC).
- **Dual-Column Timeline**: 
  - **Crew Lane**: Tracks wakes, meals, exercise, medical checks (PMC/DPC), and sleep cycles.
  - **Attitude Lane**: Tracks burns, separations, telescope checkouts, and passive thermal control (PTC) rolls.
- **Flight Path Tracking**: A visual "figure-8" trajectory representation with an animated Orion spacecraft icon.
- **Dynamic Timezone Selector**: View mission milestones in **Central (CT)**, **Eastern (ET)**, **Pacific (PT)**, **AEDT (Sydney)**, or **GMT (Zulu)**.
- **Speed Simulation**: Fast-forward through the 10-day mission at 500x or 5000x to see future events.
- **Premium UI**: Dark mode, glassmorphic effects, and smooth animations using vanilla CSS.

## 🛠️ Technology Stack

- **HTML5**: Semantic structure.
- **Vanilla CSS**: Custom styling with glassmorphism and keyframe animations.
- **JavaScript (ES6)**: Real-time simulation engine and dynamic DOM rendering.
- **YouTube API**: Embedded live coverage support.

## 📋 Data Source

All mission events—including the granular "Day in the Life" routines—are derived from the official Artemis II mission protocol and flight day schedules.

## 🚦 How to Use

### Direct Browser
1. Clone this repository to your local machine.
2. Open `index.html` in any modern web browser.
3. Use the **Timezone** dropdown to sync the timeline to your local clock.
4. Use the **Speed** buttons to fast-forward or the **Reset** button to return to real-time.

### Docker (Recommended)
You can run the mission tracker in a portable Nginx container using either Docker or Docker Compose.

**Using Docker Compose**:
```bash
docker-compose up -d
```
Visit the dashboard at `http://localhost:8080`.

**Using Docker CLI**:
1. Build the image:
   ```bash
   docker build -t artemis-tracker .
   ```
2. Run the container:
   ```bash
   docker run -d -p 8080:80 artemis-tracker
   ```
Visit the dashboard at `http://localhost:8080`.


---
*Follow the historic return of humanity to the Moon.*
