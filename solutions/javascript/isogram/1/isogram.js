export const isIsogram = (phrase) => phrase.
  replaceAll(/[- ]/g, '').
  toLowerCase().
  split("").
  every((letter, index, letters) => letters.indexOf(letter) == index );


ADD STUFF
