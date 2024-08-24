export function generateRandomString(length: number = 14) {
  const alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let generatedString = '';

  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * alphabet.length);
    generatedString += alphabet.charAt(randomIndex);
  }
  return generatedString;
}
