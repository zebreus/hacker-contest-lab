export {};

const readFile = async (file: string) => {
  const result = await fetch("http://10.2.17.11:5000/report", {
    headers: {
      "content-type": "application/json",
    },
    body: `{\"report\":\"${file}\"}`,
    method: "POST",
  });
  if (!result.ok) {
    console.error(result);
    throw new Error("Failed to read result");
  }
  const content = await result.text();
  return content;
};

let targetFile = Deno.args[0];
if (targetFile.charAt(0) === "/") {
  targetFile = "../../../../../../../../.." + targetFile;
}

const main = await readFile(targetFile);
console.log(main);
