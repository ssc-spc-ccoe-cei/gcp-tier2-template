# Introduction 
A package to create a [Config Sync](https://cloud.google.com/anthos-config-management/docs/config-sync-overview) RepoSync object for an Azure DevOps git repo.

# Requirements
The `git-creds` secret must already be created in the KCC cluster:
```bash
kubectl create secret generic git-creds --namespace="config-management-system" --from-literal=username='<my azdo organization>' --from-literal=token='<my code read token>'
```
### GitHub Credentials
If you are using GitHub as a config sync repository the configuration of the kubernetes secret is done in the same manner. Please note you cannot have the @github.com appended to the end of your token as you see in a local .git-credentials file. GitHub recommends creating a machine account with limited repository access over a PAT. 

```bash
kubectl create secret generic git-creds --namespace="config-management-system" --from-literal=username='<my github username | machine account>' --from-literal=token='<token>'
```

> The revision (version) does not appear to work for annotated tags, like the ones created from the Azure DevOps UI.  When running `git rev-parse 0.0.0` on those, a different commit is returned and Config Sync throws an error.  Tags should be created in a way similar to this (ideally by a pipeline):
```bash
git tag 0.0.0
git push origin --tags
```

# Usage
Get the package by running the following, optionally setting the revision and destination folder:

`kpt pkg get https://PKG_URL@<REVISION> <DESTINATION_FOLDER>`

Follow instructions inside the `setters-version.yaml` and `setters.yaml` to customize for your environment. Examples have been provided for GitHub. Comment out the AZDO sections and comment in the GitHub appropriately.