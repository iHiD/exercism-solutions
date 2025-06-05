export const colorCode = (color) => COLORS.indexOf(color);

export const value = (colors) => {
  return colorCode(colors[0]) * 10 + colorCode(colors[1])
};

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
