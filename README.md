Velkommen til mitt kjære repository. 

For å kryptere hemmeligheter i dette repositoryet trenger du å kjøre følgende:
###google key:
Basert på operativsystem:

```travis endpoint --pro --setdefault```
eller 
```travis endpoint --pro --set-default```

```travis encrypt-file -r githubname/reponame terraform.json --add --pro```

###logz.io:
```
travis encrypt LOGZ_TOKEN=abcd1234 --add --pro
travis encrypt LOGZ_URL=abcd1234 --add --pro
```

###opsgenie

```
travis encrypt OPSGENIE_API_KEY=abcd1234 --add --pro
```


###statuscake

```travis encrypt STATUSCAKE_APIKEY=abcd1234 --add --pro```
