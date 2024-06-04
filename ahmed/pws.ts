// let middle = ["secure", "safe", "strong", "good"];
// let middle = ["secure", "safe", "strong"];
let middle = ["Secure"];
// let prefixes = ["very", "super", "ultra", "mega", "most", "more", "extremly"];
let prefixes = ["Very"];
// let suffixes = ["2023", "2024", "2042", "2025", "2026"];
let suffixes = ["2023", "2024"];
// let susuffixes = ["!", "#", "$", "%", "&", "*", "+", "-", "/", "=", "?", "@"];
// let susuffixes = ["!", "?", "."]
let susuffixes = ["!", "?", "."];

middle = middle.flatMap((prefix) => [
  prefix,
  //   prefix.slice(0, 1).toUpperCase() + prefix.slice(1),
]);
prefixes = prefixes.flatMap((prefix) => [
  prefix,
  prefix.slice(0, 1).toUpperCase() + prefix.slice(1),
]);
suffixes = suffixes
  //   .flatMap((suffix) => [suffix, suffix.slice(2, 4)])
  .flatMap((suffix) => [suffix, ...susuffixes.map((p) => suffix + p)]);

let pws = middle
  .flatMap((pw) => {
    return prefixes.map((prefix) => prefix + pw);
  })
  .flatMap((pw) => {
    return suffixes.map((suffix) => pw + suffix);
  });

const getAllLeetspeakVariants = (word: string) => {
  const leetMap: { [key: string]: string } = {
    a: "4",
    b: "8",
    e: "3",
    g: "6",
    i: "1",
    l: "1",
    o: "0",
    s: "5",
    t: "7",
    z: "2",
    "2": "Z",
    "0": "O",
    "4": "A",
    "3": "E",
  };
  const leetVariants = new Set<string>();
  const recurse = (word: string, index: number) => {
    if (index === word.length) {
      leetVariants.add(word);
      return;
    }
    const char = word[index];
    if (char.toLowerCase() in leetMap) {
      recurse(
        word.slice(0, index) +
          leetMap[char.toLowerCase()] +
          word.slice(index + 1),
        index + 1
      );
    }
    recurse(word, index + 1);
  };
  recurse(word, 0);
  return Array.from(leetVariants);
};
pws = pws.flatMap((pw) => getAllLeetspeakVariants(pw));

await Deno.writeTextFile("./pws.txt", pws.join("\n"));
