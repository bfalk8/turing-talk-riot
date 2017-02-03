import style from './message-input.css';
import {handleKeyPress} from './message-input.js';

<message-input class={style.row}>
  <input ref='input' class={style.text} type="text"
    placeholder={placeholder}
    onkeydown={handleKeyPress}
  />

  <script>
    this.style = style;
    this.placeholder = opts.placeholder || 'What do you want to broadcast?';
    this.handleKeyPress = handleKeyPress.bind(this);
  </script>
</message-input>
