# Screenshot Script

## Features

- Take a screenshot with a selectable area.
- Add a gradient border to the screenshot.
- Save the screenshot in the `~/Pictures/Screenshots/` directory, with a timestamp.
- Copy the screenshot to the clipboard.

## Prerequisites

This script depends on the following programs, they must be installed on the environment where the script runs.

- `scrot`: Tool for taking screenshots.
- `xclip`: Tool for copying images to the clipboard.
- `ImageMagick`: Tool for image processing.

## Installation
`git clone https://github.com/DatCodeMania/LinuxSSTool.git`

`cd LinuxSSTool`

`chmod +x take-screenshot.sh`

`./take-screenshot.sh`

From here on out, you can then move this script to wherever you want, e.g. `~/.config/scripts`, and then call it using your WM/DE with a keybind, or any other method of your choosing.
