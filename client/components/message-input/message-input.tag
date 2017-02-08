import style from './message-input.css';
import {handleKeyPress, handleBtnPress} from './message-input.js';

<message-input class={style.flexRow}>
  <input ref='input' class={style.flexInput} type="text"
    placeholder={placeholder}
    onkeydown={handleKeyPress}
  />

  <button class={style.flexButton} onclick={handleBtnPress}>
    Broadcast!
  </button>

  <script>
    this.style = style;
    this.placeholder = opts.placeholder || 'What do you want to broadcast?';
    this.handleKeyPress = handleKeyPress.bind(this);
    this.handleBtnPress = handleBtnPress.bind(this);
  </script>
</message-input>
