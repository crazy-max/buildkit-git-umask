## Repro

```shell
$ git init
$ mkdir test
$ touch test/test.txt
$ touch test.sh
$ touch README.md
$ git add *
$ git commit -m "test"

$ git ls-files -s .
100644 a7d01eda217b0758f4a106f3222ae532bc77b9bf 0       README.md
100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0       test.sh
100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0       test/test.txt

$ git update-index --chmod=+x test.sh
$ git add *
$ git commit -m "test2"

$ git ls-files -s .
100644 b500b4da14cea1f1d8a43c7d764518eecc7bb395 0       README.md
100755 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0       test.sh
100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0       test/test.txt
```

```shell
$ docker buildx build --builder default .
...
#9 [5/5] RUN stat -c '%a %n' *
#9 0.155 644 README.md
#9 0.155 755 test.sh
#9 0.155 644 test.txt
#9 DONE 0.2s
$ docker buildx build --builder default https://github.com/crazy-max/buildkit-git-umask.git
...
#7 [5/5] RUN stat -c '%a %n' *
#7 0.428 644 README.md
#7 0.428 755 test.sh
#7 0.428 644 test.txt
#7 DONE 0.5s
```

```shell
$ docker buildx create --name ctn --use
$ docker buildx build --builder ctn .
...
#11 [5/5] RUN stat -c '%a %n' *
#11 0.191 644 README.md
#11 0.191 755 test.sh
#11 0.191 644 test.txt
#11 DONE 0.2s
$ docker buildx build --builder ctn https://github.com/crazy-max/buildkit-git-umask.git
#7 [5/5] RUN stat -c '%a %n' *
#7 0.181 666 README.md
#7 0.181 777 test.sh
#7 0.181 666 test.txt
#7 DONE 0.2s
```
