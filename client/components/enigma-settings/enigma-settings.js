export const rotorOptions = Array.from(Array(8).keys());
export const shiftOptions = Array.from(Array(26).keys());
export const alphabet = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
export const stdPlug = [' ', ' '];
export const maxPlugs = 10;

export function handleUpdate(e) {
  let updatedSettings = {};
  updatedSettings[e.target.name] = parseInt(e.target.value);
  riot.control.trigger('settings.change', updatedSettings);
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
  this.update();
}
