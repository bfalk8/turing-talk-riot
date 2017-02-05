import style from './enigma-settings.css';
import {rotorOptions, shiftOptions, alphabet, stdPlug, maxPlugs, handleUpdate, updateSettings} 
  from './enigma-settings.js';

<enigma-settings>
  <h1 class={style.title}>Enigma Settings</h1>

  <div class={style.row}>
    <div class={style.col}>
      <p>Left Rotor</p>
      <select name="leftRotor" onchange={handleUpdate}>
        <option each={x in rotorOptions} value={x+1} selected={x+1 == leftRotor}>
          {x+1}
        </option>
      </select>
    </div>

    <div class={style.col}>
      <p>Middle Rotor</p>
      <select name="middleRotor" onchange={handleUpdate}>
        <option each={x in rotorOptions} value={x+1} selected={x+1 == middleRotor}>
          {x+1}
        </option>
      </select>
    </div>

    <div class={style.col}>
      <p>Right Rotor</p>
      <select name="rightRotor" onchange={handleUpdate}>
        <option each={x in rotorOptions} value={x+1} selected={x+1 == rightRotor}>
          {x+1}
        </option>
      </select>
    </div>
  </div>

  <div class={style.row}>
    <div class={style.col}>
      <p>Left Shift</p>
      <select name="leftShift" onchange={handleUpdate}>
        <option each={x in shiftOptions} value={x} selected={x == leftShift}>
          {x}
        </option>
      </select>
    </div>

    <div class={style.col}>
      <p>Middle Shift</p>
      <select name="middleShift" onchange={handleUpdate}>
        <option each={x in shiftOptions} value={x} selected={x == middleShift}>
          {x}
        </option>
      </select>
    </div>

    <div class={style.col}>
      <p>Right Shift</p>
      <select name="rightShift" onchange={handleUpdate}>
        <option each={x in shiftOptions} value={x} selected={x == rightShift}>
          {x}
        </option>
      </select>
    </div>
  </div>

  <script>
    this.style = style;
    this.rotorOptions = rotorOptions;
    this.shiftOptions = shiftOptions;
    this.alphabet = alphabet;
    this.stdPlug = stdPlug;
    this.maxPlugs = maxPlugs;
    this.leftRotor = 1;
    this.middleRotor = 2;
    this.rightRotor = 3;
    this.leftShift = 0;
    this.middleShift = 0;
    this.rightShift = 9;
    this.plugboard = [];

    this.handleUpdate = handleUpdate.bind(this);

    riot.control.on('settings.update', updateSettings.bind(this));
  </script>
</enigma-settings>
