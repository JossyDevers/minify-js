## Github Action
Please refer [action.yml](action.yml) for parameters.

### Sample

```yaml
steps:
  - name: Minify-JS Action
    uses: devatherock/minify-js@v1.0.1
    with:
      directory: 'src'      # Optional
      output: 'minify/src'  # Optional
      add_suffix: false     # Optional
```

## vela
### Config

The following parameters can be set to configure the plugin.

* **input_path** - File to minify or a folder containing files to minify. By default, all files in current folder and 
  its sub-folders will be minified
* **output_path** - Path where the minified files will be saved. By default, the minified files will be saved in the 
  original file path
* **add_suffix** - Indicates if the output files should have the suffix `.min` added after the name. Default is true

### Sample

```yaml
steps:
  - name: minify_js
    ruleset:
      branch: master
      event: push
    image: devatherock/minify-js:latest
    parameters:
      input_path: src
      output_path: minify/src
      add_suffix: false
```

## CircleCI

```yaml
version: 2.1
jobs:
  minify_js:
    docker:
      - image: devatherock/minify-js:latest
    working_directory: ~/my-repo
    environment:
      PARAMETER_INPUT_PATH: src
      PARAMETER_OUTPUT_PATH: minify/src
      PARAMETER_ADD_SUFFIX: false
    steps:
      - checkout
      - run: sh /entrypoint.sh
```