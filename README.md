### Dockerized AFL for Aarch64 Binaries using QEMU

1. Build docker
   ```
   docker build -t afl-aarch64 .
   ```

2. Run afl with the script:
   ```
   ./run.sh <io dir name> <seed dir name> <binary path> <args ...>
   ```
   
3. Manual command:
   ```
   $ docker run --rm -v /home/cpuu/afl-aarch64/io:/home/afl/io -v /home/cpuu/afl-aarch64/tests:/home/afl/tests afl-aarch64 -m none -Q -i /home/afl/tests/vuln/seeds -o /home/afl/io /home/afl/tests/vuln/vuln @@
   ```

### Example 1

```
rm -rf ./io
./run.sh io tests/vuln/seeds tests/vuln/vuln @@
```

