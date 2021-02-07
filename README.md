[![CircleCI](https://circleci.com/gh/devatherock/minify-js.svg?style=svg)](https://circleci.com/gh/devatherock/scriptjar)
[![Version](https://img.shields.io/docker/v/devatherock/minify-js?sort=semver)](https://hub.docker.com/r/devatherock/minify-js/)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/a8694aab3fe44e6da2696ad628daf618)](https://www.codacy.com/gh/devatherock/minify-js/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=devatherock/minify-js&amp;utm_campaign=Badge_Grade)
[![Docker Pulls](https://img.shields.io/docker/pulls/devatherock/minify-js.svg)](https://hub.docker.com/r/devatherock/minify-js/)
[![Docker Image Size](https://img.shields.io/docker/image-size/devatherock/minify-js.svg?sort=date)](https://hub.docker.com/r/devatherock/minify-js/)
[![Docker Image Layers](https://img.shields.io/microbadger/layers/devatherock/minify-js.svg)](https://microbadger.com/images/devatherock/minify-js)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/JossyDevers/minify-js/blob/master/LICENSE)
# Minify-JS Github Action/CI Plugin
Github action/CI Plugin to minify html, javascript and css files, using [minify](https://www.npmjs.com/package/minify).

## Usage
### Docker
```shell
docker run --rm \
  -v "/path/to/files":/work \
  -w=/work \
  -e PARAMETER_INPUT_PATH=/work/src \
  -e PARAMETER_OUTPUT_PATH=/work/src \
  -e PARAMETER_ADD_SUFFIX=false \
  devatherock/minify-js:latest
```

### CI
Please refer [docs](DOCS.md)