# Dockerfile Shebang

Treat your Dockerfiles as self-contained, editable scripts.

```
$ cat test.dockerfile
#!/usr/bin/env dockerfile-shebang

FROM alpine:latest
ENTRYPOINT ["echo"]

$ chmod +x test.dockerfile
$ ./test.dockerfile Hello, world!
Hello, world!
```

If you need to pass arguments to the underlying `docker run` command, put them before a `--` argument.
```
$ ./test.dockerfile --expose 80 -- Hello, world!
```

## Install

**Mac OS**

```
$ brew install JakeWharton/repo/dockerfile-shebang
```

**Other**

Download `dockerfile-shebang` script from
[latest release](https://github.com/JakeWharton/dockerfile-shebang/releases/latest).
Run `chmod +x dockerfile-shebang` and drop into a folder which is on your `$PATH`.

Want to maintain a Linux distro installation? Please do! PRs for distro installation welcome.


# License

    Copyright 2020 Jake Wharton

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
