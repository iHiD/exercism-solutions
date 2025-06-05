export const value = (colors) => {
  const digits = colors.slice(0,2).map(c => colorCode(c));
  return Number(digits.join(''))
};

const colorCode = (color) => COLORS.indexOf(color);

const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
];
