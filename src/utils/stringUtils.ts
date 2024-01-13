export function generateRandomString() {
  const alphabet = "abcdefghijklmnopqrstuvwxyz";
  let generatedString = "";

  for (let i = 0; i < 10; i++) {
    const randomIndex = Math.floor(Math.random() * alphabet.length);
    generatedString += alphabet.charAt(randomIndex);
  }
  return generatedString;
}
