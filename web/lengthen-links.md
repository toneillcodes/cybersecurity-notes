# Lengthening Links
Many platforms automatically shorten links.<br>
Where do they go? Click it and find out! :) Just kidding - check first<br>
## LinkedIn
Using curl, grep and sed
```
curl https://lnkd.in/<id-value> | grep external_url_click | sed -n 's/.*href="\([^"]*\).*/\1/p'
```
