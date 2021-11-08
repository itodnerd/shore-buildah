# Buildah Scripts to build Shore-Kits and Shore-MT

these 3 scripts create a shore-kits container in three steps:

1. Create a fresh Container with all the prerequesites
2. Build Shore-MT on top
3. Build Shore-Kits on top

## Usage of shore-kits:

```bash
cd home/git/kits
vim shore.config # modify config of shore-kits (what should be run)
./shore-kits -r # -r to rebuild database
```

## WARNING:

- Shore-Kits is modified to print Page accesses during test to stderr.  
  You can disable this by reverting https://github.com/itodnerd/shore-kits/commit/dea19e3c5c972cb4f130e5785df83f0eecd16489
  
