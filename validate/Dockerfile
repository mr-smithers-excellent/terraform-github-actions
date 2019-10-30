FROM mrsmithers/terraform-gh-actions:0.12.12

LABEL "com.github.actions.name"="terraform validate"
LABEL "com.github.actions.description"="Validate the terraform files in a directory"
LABEL "com.github.actions.icon"="alert-triangle"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/mr-smithers-excellent/terraform-github-actions"
LABEL "homepage"="http://github.com/mr-smithers-excellent/terraform-github-actions"
LABEL "maintainer"="Sean Smith"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
