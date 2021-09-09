
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
