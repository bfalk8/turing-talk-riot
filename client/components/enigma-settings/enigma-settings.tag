import style from './enigma-settings.css';
import {rotorOptions, shiftOptions, alphabet, stdPlug, maxPlugs, handleUpdate, updateSettings, handlePlugAdd, handlePlugUpdate} 
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

  <div if={hasError} class={style.errorBox}>
    {errorMsg}
  </div>

  <div class={style.row}>
    <div class={style.colWhole}>
      <p>Plug Board</p>
    </div>
  </div>

  <div class={style.row}>
    <button class={style.addBtn} onclick={handlePlugAdd}>
      + Add Plug +
    </button>
  </div>

  <div class={style.row} each={plug, index in plugboard}>
    <div class={style.col}>
      <select name={'plugA ' + index} onchange={handlePlugUpdate} value={plug[0]}>
        <option each={x in alphabet} value={x} selected={plug[0] === x}>{x}</option>
      </select>
    </div>

    <div class={style.col}>
      {'<--->'}
    </div>

    <div class={style.col}>
      <select name={'plugB ' + index} onchange={handlePlugUpdate} value={plug[1]}>
        <option each={x in alphabet} value={x} selected={plug[1] === x}>{x}</option>
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
    this.rightShift = 0;
    this.plugboard = [];

    this.hasError = false;
    this.errorMsg = '';

    this.handleUpdate = handleUpdate.bind(this);
    this.handlePlugUpdate = handlePlugUpdate.bind(this);
    this.handlePlugAdd = handlePlugAdd.bind(this);
    this.on('mount', () => {
      riot.control.on('settings.update', updateSettings.bind(this));
    });
  </script>
</enigma-settings>
