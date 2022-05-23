# PUML: A collection of helpful PlantUML tools

## PlantUML command-line interface

`bin/plantuml` command-line interface uses Docker to run PlantUML without
necessity to install Graphviz, Java, and so on.

Due to the fact that PlantUML runs inside of a Docker container there is no
easy way to access files on the host system. However it's totally possible to
pipe files to the tool.

```shell
docker build --tag "soulim/plantuml" .
cat test.puml | ./bin/plantuml
```

## License

Copyright (c) 2021-2022 Alexander Sulim

PUML is free software: you can redistribute it and/or modify it under the terms of
the GNU General Public License as published by the Free Software Foundation,
either version 3 of the License, or (at your option) any later version.

See [COPYING](COPYING) for license text.
