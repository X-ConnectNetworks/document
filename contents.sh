#!/bin/bash
DOCS_DIR="docs/$1/$2"
GHPAGES_DIR="$1/$2"
CONTENTS_TMP=".contents.tmp"
INDEX_FILE_NAME="index.md"
BASE_URL="$3"

ls ${DOCS_DIR} >| ${CONTENTS_TMP}

echo "# ${GHPAGES_DIR} パラメータ一覧" >| ${DOCS_DIR}/${INDEX_FILE_NAME}
echo "" >> ${DOCS_DIR}/${INDEX_FILE_NAME}

while read PARAM_FILE_NAME
do
  if [ "${PARAM_FILE_NAME}" = "${INDEX_FILE_NAME}" ]; then
    continue
  fi

  PARAM_FILE_NAME_HTML=$(echo ${PARAM_FILE_NAME} | sed -e "s/\.md$/.html/g")
  echo "- [${PARAM_FILE_NAME}](${BASE_URL}/${GHPAGES_DIR}/${PARAM_FILE_NAME_HTML})" >> ${DOCS_DIR}/${INDEX_FILE_NAME}
done < ${CONTENTS_TMP}

rm -f ${CONTENTS_TMP}
