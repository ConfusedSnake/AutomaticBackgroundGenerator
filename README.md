# SFML Cross-platform Starter (macOS + WSL2)

Dette repoet gir dere en *så lik* byggeopplevelse som mulig på macOS og i WSL2 ved å bruke:

- **CMake Presets** (samme kommandoer overalt)
- **Ninja** (rask og stabil generator)
- **vcpkg** (samme SFML-avhengighet på begge OS)

## 0) Forutsetninger

### macOS
- Xcode Command Line Tools: `xcode-select --install`
- CMake og Ninja: `brew install cmake ninja`

### WSL2 (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install -y build-essential cmake ninja-build git
```

> Tips: dere kan bruke **clang** i stedet for gcc om dere vil.

## 1) Hent vcpkg (én gang)

Dette repoet forventer vcpkg i `external/vcpkg/`.

### Anbefalt: git submodule (best for team)
I roten av repoet:
```bash
git submodule add https://github.com/microsoft/vcpkg external/vcpkg
git submodule update --init --recursive
```

Når alle kloner repoet senere:
```bash
git clone <repo>
cd <repo>
git submodule update --init --recursive
```

### Alternativ: bare klon vcpkg (ingen submodule)
```bash
mkdir -p external
cd external
git clone https://github.com/microsoft/vcpkg
cd ..
```

## 2) Bootstrap vcpkg (én gang per maskin)

### macOS / WSL2
```bash
./external/vcpkg/bootstrap-vcpkg.sh
```

## 3) Installer dependencies (SFML)

vcpkg bruker `vcpkg.json` i repoet:
```bash
./external/vcpkg/vcpkg install
```

## 4) Bygg

### Debug
```bash
cmake --preset debug
cmake --build --preset debug
```

### Release
```bash
cmake --preset release
cmake --build --preset release
```

Binæren havner i:
- `build/debug/` eller `build/release/`

## 5) Kjør

```bash
./build/debug/sfml_starter
```

## Vanlige problemer

- **"CMAKE_TOOLCHAIN_FILE" finnes ikke**
  - Sjekk at `external/vcpkg/` faktisk finnes og er bootstrappet.

- **WSL2 og GUI**
  - For å *kjøre* SFML-app i WSL trenger du en GUI-løsning (f.eks. WSLg på Windows 11). Hvis dere bare trenger å bygge i WSL, er det alltid ok.

- **macOS tillatelser / Gatekeeper**
  - Ved kjøring av lokal binær er dette vanligvis ikke et problem for dev.

## Struktur
- `src/main.cpp` – minimal SFML-app
- `CMakeLists.txt` – target + SFML linking
- `vcpkg.json` – dependencies
- `CMakePresets.json` – faste presets for debug/release
