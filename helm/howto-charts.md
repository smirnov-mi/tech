# how to create and maintain helm charts


## create a helm chart

...


## publish a chart


find a place to host your chart, e.g. GitHub Pages or Gitlab Repository

Create an index :

```bash
helm repo index charts-gitea --url https://smirnov-mi.github.io/charts-gitea/
```

Push everything into that git repo. Give it a few moments to auto-generate the page.


connect to you repo:
```bash
helm repo add https://smirnov-mi.github.io/charts-gitea/
```



