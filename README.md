# Countdown Timer with GIF Animation

This Flutter application demonstrates a list of items, each containing its own countdown timer and GIF animation. The application employs an event bus for state management and utilizes visibility detection to optimize GIF playback and countdown updates.

## Features

- **Event Bus**: Uses an event bus to emit countdown events and update the UI efficiently without unnecessary rebuilds.
- **Countdown Timer**: Each list item features an independent countdown timer that starts when the item becomes visible on the screen.
  - There are two types of timers in the application:
    1. **Global Timer**: A shared global timer that all list items depend on. When the list appears on the screen, each item starts from the current global countdown time.
    2. **Individual Timer**: A separate timer for each list item. When a list item becomes visible on the screen, it starts its own countdown timer. When it goes off-screen, the timer stops.
- **GIF Animation**: Displays a GIF animation for each list item, which plays only when the item is visible on the screen.
- **Visibility Detection**: Utilizes the `VisibilityDetector` package to manage the visibility of each list item, ensuring performance optimizations.

## images 
<img src="https://github.com/user-attachments/assets/2a9be6a4-b5a2-46d4-b2e1-0ac42f1ebde7" width="200" height="400"/>
<img src="https://github.com/user-attachments/assets/cd3d441e-13a4-4666-919c-47ddef931de2" width="200" height="400"/>
<img src="https://github.com/user-attachments/assets/6f914702-ec59-4637-b946-5d10dc94dda9" width="200" height="400"/>

## Getting Started

### Prerequisites

- Flutter SDK (version 2.0 or above)
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/moayad-tarig/task_eventbus_app
