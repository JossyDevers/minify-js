# Minify-JS Action

## Package Managers

## License
[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/JossyDevers/minify-js/blob/master/LICENSE) 

## Version
[![GitHub Release](https://img.shields.io/github/v/release/jossydevers/minify-js)]()

Github action to minify html, javascript and css files, using [minify](https://www.npmjs.com/package/minify).

### Usage
First you need to check out your repository, then configure the Minify-JS job, at the end you can commit to your repository.
Below is an example of how to do all of this.

```yaml
name: Minify Workflow
on:
  push:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.ref }}

      # Job for Minify-JS
      - name: Minify-JS Action
        uses: jossydevers/minify-js@v1.0.0
        with:
          directory: 'src/component.js' # (OPTIONAL)
          output: 'minify/src/' # (OPTIONAL)
          
      # Auto-commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: 'Minify-JS : Commit Pipeline'
          branch: ${{ github.ref }}
```
