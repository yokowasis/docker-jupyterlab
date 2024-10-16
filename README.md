# Introduction

Docker image for jupyter lab with C++, Javascript support.

# Password


# Environment Variable and PORT

## Password

- `NOTEBOOK_PASSWORD`

Generate password hash with google collab

```
from notebook.auth import passwd; passwd()
```

## PORT

Dewfault Port is 8008, or you can set the environment `PORT`
