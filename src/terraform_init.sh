#!/bin/bash

function terraformInit {
  echo "init: info: initializing Terraform configuration in ${tfWorkingDir}"
  initOutput=$(terraform init -input=false)
  initExitCode=${?}
  
  # Exit code of 0 indicates success.
  if [ ${initExitCode} -eq 0 ]; then
    echo "init: info: successfully initialized Terraform configuration in ${tfWorkingDir}"
    echo "${initOutput}"
    echo
    exit ${initExitCode}
  # Otherwise, print the output and exit.
  else
    echo "init: error: failed to initialize Terraform configuration in ${tfWorkingDir}"
    echo "${initOutput}"
    echo

    # Comment on the pull request
    if [ "$GITHUB_EVENT_NAME" == "pull_request" ] && [ "${tfComment}" == "1" ]; then
      initCommentWrapper="#### \`terraform init\` Failed
\`\`\`
${initOutput}
\`\`\`
*Workflow: \`${GITHUB_WORKFLOW}\`, Action: \`${GITHUB_ACTION}\`*"
      echo "init: info: creating JSON"
      initPayload=$(echo '{}' | jq --arg body "${initCommentWrapper}" '.body = $body')
      initCommentsURL=$(cat ${GITHUB_EVENT_PATH} | jq -r .pull_request.comments_url)
      echo "init: info: commenting on the pull request"
      curl -s -S -H "Authorization: token ${GITHUB_TOKEN}" --header "Content-Type: application/json" --data "${initPayload}" "${initCommentsURL}" > /dev/null
    fi
    exit ${initExitCode}
  fi
}