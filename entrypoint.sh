#!/bin/sh

minify_file() {
  directory=$1
  basename=$(basename $directory)
  extension="${basename##*.}"
  output=""
  if [ -z "$OUTPUT_PATH" ]; then
    output="${directory%/*}/"
  else
    mkdir -p $OUTPUT_PATH
    output="$OUTPUT_PATH"
  fi
  filename="${basename%.*}"

  if [ "$ADD_SUFFIX" = "false" ]; then
    output_path="${output}${filename}.${extension}"
  else
    output_path="${output}${filename}.min.${extension}"
  fi

  # Delete output file if it already exists and is not the same as input file
  if [ "${output_path}" != "${directory}" ]; then
    rm -rf "${output_path}"
  fi

  minify ${directory} | sponge ${output_path}
  echo "Minified ${directory} > ${output_path}"
}

INPUT_PATH="."
ADD_SUFFIX=true

# If true, a .min suffix will be added, after the file name, before the extension
if [ "$PLUGIN_ADD_SUFFIX" = "false" ] || [ "$PARAMETER_ADD_SUFFIX" = "false" ] || [ "$INPUT_ADD_SUFFIX" = "false" ]; then
  ADD_SUFFIX=false
fi

if [ ! -z "$INPUT_DIRECTORY" ]; then
  INPUT_PATH=$INPUT_DIRECTORY
elif [ ! -z "$PLUGIN_INPUT_PATH" ]; then
  INPUT_PATH=$PLUGIN_INPUT_PATH
elif [ ! -z "$PARAMETER_INPUT_PATH" ]; then
  INPUT_PATH=$PARAMETER_INPUT_PATH
fi

if [ ! -z "$INPUT_OUTPUT" ]; then
  OUTPUT_PATH=$INPUT_OUTPUT
elif [ ! -z "$PLUGIN_OUTPUT_PATH" ]; then
  OUTPUT_PATH=$PLUGIN_OUTPUT_PATH
elif [ ! -z "$PARAMETER_OUTPUT_PATH" ]; then
  OUTPUT_PATH=$PARAMETER_OUTPUT_PATH
fi

# If the input path is a file, process that file alone
case $INPUT_PATH in
*".js") minify_file $INPUT_PATH ;;
*".html") minify_file $INPUT_PATH ;;
*".css") minify_file $INPUT_PATH ;;
*)
  # If input file does not end with one of the supported extensions, treat it as a path
  case $INPUT_PATH in
  *"/") ;;
  *) INPUT_PATH="$INPUT_PATH/" ;;
  esac

  # If output path does not end with /, append it
  if [ ! -z "$OUTPUT_PATH" ]; then
    case $OUTPUT_PATH in
    *"/") ;;
    *) OUTPUT_PATH="$OUTPUT_PATH/" ;;
    esac
  fi

  find $INPUT_PATH -type f \( -iname \*.html -o -iname \*.js -o -iname \*.css \) | while read fname; do
    case $fname in
    *".min."*) ;;
    *) minify_file $fname ;;
    esac
  done
  ;;
esac
