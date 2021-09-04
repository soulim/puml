# PUML: A collection of helpful PlantUML tools

## PlantUML command-line interface

`bin/plantuml` command-line interface uses Docker to run PlantUML without
necessity to install Graphviz, Java, and so on.

Due to the fact that PlantUML runs inside of a Docker container there is no
easy way to access files on the host system. However it's totally possible to
pipe files to the tool.

```shell
cat test.puml | ./bin/plantuml
```

## Copyright

2021, [Alexander Sulim](https://sul.im)
