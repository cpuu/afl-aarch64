### Dockerized AFL for Aarch64 Binaries

1. Build docker
   ```
   docker build -t afl-aarch64 .
   ```

2. Run afl with the script:
   ```
   ./run.sh <io dir name> <seed dir name> <binary path> <args ...>
   ```

### Example 1

```
rm -rf ./io
./run.sh io tests/vuln/seeds tests/vuln/vuln @@
```

