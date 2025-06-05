export const value = ([tens, digits]) => {
  return colorCode(tens) * 10 + colorCode(digits)
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
