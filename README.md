# pass-hash

Minimal SHA-1 hashing extension for **GNU Pass**.

Hashes the **first line** of password entries. Supports single-entry and batch mode.

---

## Installation

```bash
mkdir -p ~/.password-store/.extensions
cp hash.bash hashes.bash ~/.password-store/.extensions/
chmod +x ~/.password-store/.extensions/*.bash
```

---

## Usage

### Single entry

```bash
pass hash <entry>
```

### Batch mode

```bash
pass hashes [subfolder] > output.txt
```

* Scans folder recursively, ignores hidden files
* Outputs `<SHA1_HASH> <entry>` per line

---

## Notes

* Empty passwords are skipped
