export const rotorOptions = Array.from(Array(8).keys());
export const shiftOptions = Array.from(Array(26).keys());
export const alphabet = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
export const stdPlug = [' ', ' '];
export const maxPlugs = 10;

function showError(tag, errorMsg) {
  tag.hasError = true;
  tag.errorMsg = errorMsg;
  console.error(errorMsg);
}

function clearError(tag) {
  tag.hasError = false;
  tag.errorMsg = '';
}

export function handleUpdate(e) {
  let updatedSettings = {};
  updatedSettings[e.target.name] = parseInt(e.target.value);
  riot.control.trigger('settings.change', updatedSettings);
}

export function handlePlugAdd() {
  clearError(this);
  if(this.plugboard.length >= maxPlugs) {
    showError(this, `Can't have more than ${maxPlugs} plugs in the plugboard!`);
    this.update();
    return;
  }
  let updatedSettings = {plugboard: this.plugboard.concat([stdPlug.slice(0)])};
  riot.control.trigger('settings.change', updatedSettings);
}

export function handlePlugUpdate(e) {
  clearError(this);
  let value = e.target.value;
  let plugIndex = parseInt(e.target.name.split(' ')[1]);
  let firstEntry = e.target.name.split(' ')[0].endsWith('A');
  let arr = this.plugboard.slice(0);
  let duplicate = arr.reduce((accum, elem, index, array) => (accum || elem.includes(value)), false);
  if(duplicate) {
    showError(this, `Can't have duplicates in plug layout! ${value} is already used!`);
    e.target.value = this.plugboard[plugIndex][firstEntry ? 0 : 1];
    this.update();
    return;
  }
  arr[plugIndex][firstEntry ? 0: 1] = value;
  let updatedSettings = {plugboard: arr};
  riot.control.trigger('settings.change', updatedSettings);
  this.update();
}

export function updateSettings(settings) {
  this.leftRotor   = (settings.leftRotor === undefined) 
    ? this.leftRotor : settings.leftRotor;
  this.middleRotor = (settings.middleRotor === undefined) 
    ? this.middleRotor : settings.middleRotor;
  this.rightRotor  = (settings.rightRotor === undefined) 
    ? this.rightRotor : settings.rightRotor;
  this.leftShift   = (settings.leftShift === undefined) 
    ? this.leftShift : settings.leftShift;
  this.middleShift = (settings.middleShift === undefined) 
    ? this.middleShift : settings.middleShift;
  this.rightShift  = (settings.rightShift === undefined) 
    ? this.rightShift : settings.rightShift;
  this.plugboard  = (settings.plugboard === undefined) 
    ? this.plugboard : settings.plugboard;
  this.update();
}
