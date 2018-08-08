# Preflight

Preflight helps you setup a new macos or ubuntu workstation. This repo is highly 
opionated, so feel free to fork it and make it your own.

## macos

```
bash <(curl https://raw.githubusercontent.com/ariejan/preflight/master/bin/setup)
```

This will first ask to install **Command Line Tools** in order to install `git`. 
Once CLT are installed, re-run the bash-curl command. 

_You may need to interact with Preflight during installation. Most notably you
will be asked for your password when executing administrative tasks (like software
update or installing applications in `/Applications`)._
