export const generatePlate = (): string => {
  const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  let result = "";

  for (let i = 0; i < 7; i++) {
    // Considerando uma placa com 3 letras e 4 números (formato Mercosul)
    result += characters.charAt(Math.floor(Math.random() * characters.length));
  }

  return result;
};
