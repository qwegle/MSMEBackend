export const convertTimestamp = (timestamp) => {
  const date = new Date(timestamp);
  const kolkataString = date.toLocaleString('en-IN', {
    timeZone: 'Asia/Kolkata',
    hour12: false,
  });
  const [timePartRaw, datePartRaw] = kolkataString.split(', ');
  const [day, month, year] = datePartRaw.split('/');
  const datePart = `${day.padStart(2, '0')}/${month.padStart(2, '0')}/${year}`;
  const timePart = timePartRaw;
  const fullFormatted = `${timePart} - ${datePart}`;
  return {
    timePart,
    datePart,
    fullFormatted
  };
};
