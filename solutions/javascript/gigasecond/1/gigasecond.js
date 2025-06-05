export const gigasecond = (date) => {
  return new Date(date.getTime() + gs_ms)
};

// The gigasecond constant in miliseconds
const gs_ms = 10**9 * 1000
