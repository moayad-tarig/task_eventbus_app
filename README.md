# Countdown Timer with GIF Animation

This Flutter application demonstrates a list of items, each containing its own countdown timer and GIF animation. The application employs an event bus for state management and utilizes visibility detection to optimize GIF playback and countdown updates.

## Features

- **Countdown Timer**: Each list item features an independent countdown timer that starts when the item becomes visible on the screen.
- **GIF Animation**: Displays a GIF animation for each list item, which plays only when the item is visible.
- **Event Bus**: Uses an event bus to emit countdown events and update the UI efficiently without unnecessary rebuilds.
- **Visibility Detection**: Utilizes the `VisibilityDetector` package to manage the visibility of each list item, ensuring performance optimizations.

## images 


## Getting Started

### Prerequisites

- Flutter SDK (version 2.0 or above)
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/moayad-tarig/task_eventbus_app