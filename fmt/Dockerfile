FROM mrsmithers/terraform-gh-actions:0.12.12

LABEL "com.github.actions.name"="terraform fmt"
LABEL "com.github.actions.description"="Validate terraform files are formatted"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/mr-smithers-excellent/terraform-github-actions"
LABEL "homepage"="http://github.com/mr-smithers-excellent/terraform-github-actions"
LABEL "maintainer"="Sean Smith"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
