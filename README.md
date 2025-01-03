# puml is a collection of tools for PlantUML

[PlantUML][1] is an amazing diagramming tool.

`puml` is a set of tools that makes diagramming with PlantUML easier.
It's opinionated and created with my personal needs in mind.
However the tool set is generic enough and might be useful for you as well.
Simply try it and decide for yourself.

## Why?

`puml` grew naturally from scripts I created for personal diagramming needs.
It allows to build a Docker image that includes an official release of PlantUML and following additional components and configuration settings:

- Beautiful fonts [Noto][4] (used by default) and [Fire Code][5]
- `PLANTUML_LIMIT_SIZE` environment variable is set to `8192` to enable huge diagrams

## Dependencies

- Docker
- [entr(1)][3], used in `puml watch` to monitor for changes in diagram source files

## Available tools

### PlantUML command-line interface

```shell
puml cli
```

Passes all given command-line arguments to [PlantUML CLI][2].

### Local PlantUML server

```shell
puml serve
```

Starts a local PlantUML server available on port 8080.

### Diagram render

```shell
puml render <path> [<format>]
```

Generates a diagram image from given PlantUML source file and send it to the standard output.

### File watcher

```shell
puml watch <path> [<format>]
```

Uses `entr(1)` to watch for changes in given PlantUML source file.
An output diagram image is updated on each change in the source file.

## Installation

Clone the repository:

```shell
git clone git@github.com:soulim/puml.git
```

Install `puml` by creating a symbolic link to `bin/puml` (in the following example a symbolic link is created in `$HOME/.local/bin/`):

```shell
ln -sfn $PWD/bin/puml $HOME/.local/bin/puml
```

Build a local Docker image:
```shell
puml build
```

Test `puml` (you should see an SVG source code):
```shell
cat test.puml | puml cli
```

## Contributing

`puml` is open to code contributions for bug fixes only. As features might carry a
long-term maintenance burden, they will not be accepted at this time. Please
[submit an issue](https://github.com/soulim/puml/issues) if you have a feature you
would like to request.

## License

Copyright (c) 2021-2025 Alexander Sulim

`puml` is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

See [COPYING](COPYING) for license text.


[1]: https://plantuml.com/
[2]: https://plantuml.com/command-line
[3]: https://eradman.com/entrproject/
[4]: https://fonts.google.com/noto
[5]: https://github.com/tonsky/FiraCode
