# Triggernometry ACT FFXIV - EN to FR TTS Translator

This project provides a ready-to-use Docker setup to automatically translate Triggernometry XML files (for ACT, Triggernometry plugin) from English to French for TTS alerts.

## How to use

1. Download or clone this repository to your computer (Windows, Mac, or Linux).
2. Place your English XML files (exported from Triggernometry) in the `en/` folder.
3. **If you are on Windows and do not have Docker:**
   - Download Docker Desktop for Windows from the official website: https://www.docker.com/products/docker-desktop/
   - Run the installer and follow the instructions.
   - After installation, launch Docker Desktop and ensure it is running (the Docker icon should appear in your system tray).
   - Open a terminal (PowerShell or Command Prompt) and check Docker is working:
     ```powershell
     docker --version
     docker compose version
     ```
4. Run the translation with Docker (works on any OS):
   ```bash
   docker compose run --rm triggernometry-translator
   ```
5. The translated files will appear in the `fr/` folder with the `-fr.xml` suffix.

## Requirements

- Docker

### How to install Docker on Windows

1. Download Docker Desktop for Windows from the official website:
   https://www.docker.com/products/docker-desktop/
2. Run the installer and follow the instructions.
3. After installation, launch Docker Desktop and ensure it is running (the Docker icon should appear in your system tray).
4. Open a terminal (PowerShell or Command Prompt) and check Docker is working:
   ```powershell
   docker --version
   docker compose version
   ```
5. You can now use the provided docker compose command in this project.

## Project structure

```
/50GB/ff/
├── en/                # English XML files (source)
├── fr/                # French XML files (translate)
├── script/translate.sh
├── Dockerfile
├── docker-compose.yml
├── LICENSE.MD
└── README.MD
```

## License

MIT License (see LICENSE.MD)
