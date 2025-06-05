export const value = (colors) => {
  return Number(
    colors.
      slice(0,2).
      map(colorCode).
      join('')
    )
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
